//
//  Interface_Linux.swift
//  LibC
//

#if os(Linux)

import CLibC

extension Interface {
	internal static func getInterfaceMAC(_ ifAddress: ifaddrs) -> MACAddress? {
		var ifr = ifreq()
		_ = withUnsafeMutablePointer(to: &ifr.ifr_ifrn.ifrn_name) {
			let intPtr = $0.withMemoryRebound(to: Int8.self, capacity: 1) { $0 }
			strcpy(intPtr, ifAddress.ifa_name)
		}
		
		let sock = Socket(family: .IPv4, type: .Datagram, protocol: .IPv4)
		guard let socket = sock else { return nil }
		
		if ioctl(socket.cSocket, UInt(SIOCGIFHWADDR), &ifr) == -1 { return nil }
		
		let MAC_Byte_Count = 6
		var buffer = [UInt8](repeating: 0, count: MAC_Byte_Count)
		var from = ifr.ifr_ifru.ifru_addr.sa_data
		let fromPointer = withUnsafePointer(to: &from) {
			$0.withMemoryRebound(to: Int8.self, capacity: 1) { $0 }
		}
		_ = buffer.withUnsafeMutableBufferPointer {
			memcpy($0.baseAddress!, fromPointer, MAC_Byte_Count)
		}
		
		return MACAddress(buffer)
	}
}

#endif
