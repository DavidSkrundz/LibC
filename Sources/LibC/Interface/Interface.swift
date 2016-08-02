//
//  Interface.swift
//  LibC
//

import CLibC
import UnicodeOperators

private enum AddressType {
	case IPv4(String)
	case IPv6(String)
	case None
}

public struct Interface {
	public let name: String
	internal(set) public var status = InterfaceStatus()
	internal(set) public var macAddress = MACAddress.Nil
	internal(set) public var ipv4 = Address()
	internal(set) public var ipv6 = Address()
	
	internal init(name: String) {
		self.name = name
	}
	
	public static func Interfaces() -> [Interface] {
		return self.getInterfaces().sorted(by: <)
	}
	
	private static func getInterfaces() -> [Interface] {
		var interfaces = [String : Interface]()
		
		let ifAddresses_ = UnsafeMutablePointer<ifaddrs>.allocate(capacity: 1)
		var ifAddresses = Optional.some(ifAddresses_)
		guard getifaddrs(&ifAddresses) == 0 else {
			fatalError("`getInterfaces()` failed with error: \(errno)")
		}
		
		let baseAddress = ifAddresses
		while let ifAddress = ifAddresses?.pointee {
			let name = self.getInterfaceName(ifAddress)
			var interface = interfaces[name] ?? Interface(name: name)
			
			self.setIsUp(&interface, ifaddrs: ifAddress)
			self.setIsLoopback(&interface, ifaddrs: ifAddress)
			self.setAddress(&interface, ifaddrs: ifAddress)
			self.setMask(&interface, ifaddrs: ifAddress)
			self.setMAC(&interface, ifaddrs: ifAddress)
			
			interfaces[name] = interface
			
			ifAddresses = ifAddress.ifa_next
		}
		freeifaddrs(baseAddress)
		ifAddresses_.deallocate(capacity: 1)
		
		return interfaces.map { $0.value }
	}
	
	private static func getInterfaceName(_ ifAddress: ifaddrs) -> String {
		return String(cString: ifAddress.ifa_name)
	}
	
	private static func setIsUp(_ i: inout Interface, ifaddrs: ifaddrs) {
		if ifaddrs.ifa_flags & UInt32(IFF_UP) != 0 {
			i.status.isUp = true
		}
	}
	
	private static func setIsLoopback(_ i: inout Interface, ifaddrs: ifaddrs) {
		if ifaddrs.ifa_flags & UInt32(IFF_LOOPBACK) != 0 {
			i.status.isLoopback = true
		}
	}
	
	private static func setAddress(_ i: inout Interface, ifaddrs: ifaddrs) {
		switch self.getAddress(ifaddrs) {
			case let .IPv4(address): i.ipv4.ip = address
			case let .IPv6(address): i.ipv6.ip = address
			case .None: ()
		}
	}
	
	private static func setMask(_ i: inout Interface, ifaddrs: ifaddrs) {
		switch self.getMask(ifaddrs) {
			case let .IPv4(mask): i.ipv4.mask = mask
			case let .IPv6(mask): i.ipv6.mask = mask
			case .None: ()
		}
	}
	
	private static func setMAC(_ i: inout Interface, ifaddrs: ifaddrs) {
		if let macAddress = self.getInterfaceMAC(ifaddrs) {
			i.macAddress = macAddress
		}
	}
	
	private static func getAddress(_ ifAddress: ifaddrs) -> AddressType {
		guard let ifaAddress = ifAddress.ifa_addr else { return .None }
		return self.getAddr(sock: ifaAddress)
	}
	
	private static func getMask(_ ifAddress: ifaddrs) -> AddressType {
		guard let ifaNetmask = ifAddress.ifa_netmask else { return .None }
		return self.getAddr(sock: ifaNetmask)
	}
	
	private static func getAddr(sock: UnsafePointer<sockaddr>) -> AddressType {
		let buffer_Length: UInt32 = 1024
		var buffer = [Int8](repeating: 0, count: Int(buffer_Length))
		let cBuffer = buffer.withUnsafeMutableBufferPointer {
			$0.baseAddress!
		}
		
		if Int32(sock.pointee.sa_family) == AF_INET {
			let socketAddress = sock
				.withMemoryRebound(to: sockaddr_in.self, capacity: 1) { $0 }
			var source = socketAddress.pointee.sin_addr
			let strBytes = inet_ntop(AF_INET, &source, cBuffer, buffer_Length)!
			return .IPv4(String(cString: strBytes))
		} else if Int32(sock.pointee.sa_family) == AF_INET6 {
			let socketAddress = sock
				.withMemoryRebound(to: sockaddr_in6.self, capacity: 1) { $0 }
			var source = socketAddress.pointee.sin6_addr
			let strBytes = inet_ntop(AF_INET6, &source, cBuffer, buffer_Length)!
			return .IPv6(String(cString: strBytes))
		}
		
		return .None
	}
}

private func <(lhs: Interface, rhs: Interface) -> Bool {
	if (lhs.status.isUp == true) ≠ (rhs.status.isUp == true) {
		return lhs.status.isUp
	}
	
	if (lhs.ipv6.ip.isEmpty == true) ≠ (rhs.ipv6.ip.isEmpty == true) {
		return rhs.ipv6.ip.isEmpty
	}
	
	if (lhs.ipv4.ip.isEmpty == true) ≠ (rhs.ipv4.ip.isEmpty == true) {
		return rhs.ipv4.ip.isEmpty
	}
	
	if (lhs.macAddress.bytes == []) ≠ (rhs.macAddress.bytes == []) {
		return rhs.macAddress.bytes.isEmpty
	}
	
	if (lhs.status.isLoopback == true) ≠ (rhs.status.isLoopback == true) {
		return rhs.status.isLoopback
	}
	
	return lhs.name < rhs.name
}
