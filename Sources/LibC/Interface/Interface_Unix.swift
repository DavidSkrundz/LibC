//
//  Interface_Unix.swift
//  LibC
//

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)

import CLibC

extension Interface {
	internal static func getInterfaceMAC(_ ifAddress: ifaddrs) -> MACAddress? {
		guard let ifaAddress = ifAddress.ifa_addr,
			Int32(ifaAddress.pointee.sa_family) == AF_LINK else { return nil }
		
		let socketAddress = ifaAddress
			.withMemoryRebound(to: sockaddr_dl.self, capacity: 1) { $0 }
		
		let MAC_Byte_Count = 6
		if Int(socketAddress.pointee.sdl_alen) == MAC_Byte_Count {
			var macAddressBytes = [UInt8](repeating: 0, count: MAC_Byte_Count)
	
			let destination = macAddressBytes
				.withUnsafeMutableBufferPointer { $0.baseAddress }
			
			var sourceData = socketAddress.pointee.sdl_data
			let source = withUnsafePointer(to: &sourceData) {
				UnsafeRawPointer($0)
			}.advanced(by: Int(socketAddress.pointee.sdl_nlen))
			
			memcpy(destination, source, MAC_Byte_Count)
			
			return MACAddress(macAddressBytes)
		}
		return nil
	}
}

#endif
