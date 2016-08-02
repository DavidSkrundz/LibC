//
//  SocketType.swift
//  LibC
//

import CLibC

public struct SocketType: RawRepresentable {
	public static let Stream   = SocketType(rawValue: CLibC.SOCK_STREAM)
	public static let Datagram = SocketType(rawValue: CLibC.SOCK_DGRAM)
	public static let Raw      = SocketType(rawValue: CLibC.SOCK_RAW)
	
	public typealias RawValue = Int32
	public var rawValue: RawValue
	
	#if os(Linux)
	private init(rawValue: __socket_type) {
		self.rawValue = Int32(rawValue.rawValue)
	}
	#endif
	
	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}
