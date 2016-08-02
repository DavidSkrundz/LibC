//
//  AddressFamily.swift
//  LibC
//

import CLibC

public struct AddressFamily: RawRepresentable {
	public static let Unspecified = AddressFamily(rawValue: CLibC.AF_UNSPEC)
	public static let Unix        = AddressFamily(rawValue: CLibC.AF_UNIX)
	public static let Local       = AddressFamily(rawValue: CLibC.AF_LOCAL)
	public static let IPv4        = AddressFamily(rawValue: CLibC.AF_INET)
	public static let SNA         = AddressFamily(rawValue: CLibC.AF_SNA)
	public static let DECnet      = AddressFamily(rawValue: CLibC.AF_DECnet)
	public static let AppleTalk   = AddressFamily(rawValue: CLibC.AF_APPLETALK)
	public static let Route       = AddressFamily(rawValue: CLibC.AF_ROUTE)
	public static let IPX         = AddressFamily(rawValue: CLibC.AF_IPX)
	public static let ISDN        = AddressFamily(rawValue: CLibC.AF_ISDN)
	public static let IPv6        = AddressFamily(rawValue: CLibC.AF_INET6)
	public static let MAX         = AddressFamily(rawValue: CLibC.AF_MAX)
	
	public typealias RawValue = Int32
	public var rawValue: RawValue
	
	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}
