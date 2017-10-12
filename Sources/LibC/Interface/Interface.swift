//
//  Interface.swift
//  LibC
//

import CLibC

private enum AddressType {
	case IPv4(String)
	case IPv6(String)
	case none
}

public struct Interface {
	public let name: String
	public let status: InterfaceStatus
	public let macAddress: MACAddress
	private(set) public var ipv4 = [Address]()
	private(set) public var ipv6 = [Address]()
	
	private init(name: String,
	             status: InterfaceStatus,
	             macAddress: MACAddress) {
		self.name = name
		self.status = status
		self.macAddress = macAddress
	}
	
	public static func interfaces() -> [Interface] {
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
			
			var interface: Interface
			if let i = interfaces[name] {
				interface = i
			} else {
				let status = self.getInterfaceStatus(ifAddress)
				let mac = self.getMACAddress(ifAddress)
				interface = Interface(name: name,
				                      status: status,
				                      macAddress: mac)
			}
			
			let (type, address) = self.getAddress(ifAddress)
			switch type {
				case .IPv4: interface.ipv4.append(address)
				case .IPv6: interface.ipv6.append(address)
				case .none: ()
			}
			
			interfaces[name] = interface
			
			ifAddresses = ifAddress.ifa_next
		}
		freeifaddrs(baseAddress)
		ifAddresses_.deallocate(capacity: 1)
		
		return interfaces.map { $0.value }
	}
	
	private static func getInterfaceName(_ addr: ifaddrs) -> String {
		return String(cString: addr.ifa_name)
	}
	
	private static func getInterfaceStatus(_ addr: ifaddrs) -> InterfaceStatus {
		let isUp = addr.ifa_flags & UInt32(IFF_UP) != 0
		let isLoopback = addr.ifa_flags & UInt32(IFF_LOOPBACK) != 0
		return InterfaceStatus(isUp: isUp, isLoopback: isLoopback)
	}
	
	private static func getMACAddress(_ addr: ifaddrs) -> MACAddress {
		return self.getInterfaceMAC(addr) ?? .Nil
	}
	
	private static func getAddress(_ addr: ifaddrs) -> (AddressType, Address) {
		guard let ifaAddress = addr.ifa_addr else {
			return (.none, Address(ip: "", mask: ""))
		}
		guard let ifaNetmask = addr.ifa_netmask else {
			return (.none, Address(ip: "", mask: ""))
		}
		let ip = self.getAddr(sock: ifaAddress)
		let mask = self.getAddr(sock: ifaNetmask)
		
		switch (ip, mask) {
			case (.IPv4(let i), .IPv4(let m)):
				return (.IPv4(""), Address(ip: i, mask: m))
			case (.IPv6(let i), .IPv6(let m)):
				return (.IPv6(""), Address(ip: i, mask: m))
			default:
				return (.none, Address(ip: "", mask: ""))
		}
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
		
		return .none
	}
}

extension Interface: Comparable {}

public func == (lhs: Interface, rhs: Interface) -> Bool {
	return lhs.name == rhs.name && lhs.macAddress == rhs.macAddress
}

public func < (lhs: Interface, rhs: Interface) -> Bool {
	if (lhs.status.isUp == true) != (rhs.status.isUp == true) {
		return lhs.status.isUp
	}
	
	if (lhs.status.isLoopback == true) != (rhs.status.isLoopback == true) {
		return rhs.status.isLoopback
	}
	
	if (lhs.macAddress == .Nil) != (rhs.macAddress == .Nil) {
		return lhs.macAddress != .Nil
	}
	
	if (lhs.ipv6.isEmpty == true) != (rhs.ipv6.isEmpty == true) {
		return rhs.ipv6.isEmpty
	}
	
	if (lhs.ipv4.isEmpty == true) != (rhs.ipv4.isEmpty == true) {
		return rhs.ipv4.isEmpty
	}
	
	return lhs.name < rhs.name
}
