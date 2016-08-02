//
//  SocketProtocol.swift
//  LibC
//

import CLibC

public struct SocketProtocol: RawRepresentable {
	public static let IP       = SocketProtocol(rawValue: CLibC.IPPROTO_IP)
	public static let IP6      = SocketProtocol(rawValue: CLibC.IPPROTO_HOPOPTS)
	public static let ICMP     = SocketProtocol(rawValue: CLibC.IPPROTO_ICMP)
	public static let IGMP     = SocketProtocol(rawValue: CLibC.IPPROTO_IGMP)
	public static let IPIP     = SocketProtocol(rawValue: CLibC.IPPROTO_IPIP)
	public static let TCP      = SocketProtocol(rawValue: CLibC.IPPROTO_TCP)
	public static let EGP      = SocketProtocol(rawValue: CLibC.IPPROTO_EGP)
	public static let PUP      = SocketProtocol(rawValue: CLibC.IPPROTO_PUP)
	public static let UDP      = SocketProtocol(rawValue: CLibC.IPPROTO_UDP)
	public static let IDP      = SocketProtocol(rawValue: CLibC.IPPROTO_IDP)
	public static let TP       = SocketProtocol(rawValue: CLibC.IPPROTO_TP)
	public static let IPv6     = SocketProtocol(rawValue: CLibC.IPPROTO_IPV6)
	public static let Routing  = SocketProtocol(rawValue: CLibC.IPPROTO_ROUTING)
	public static let Fragment = SocketProtocol(rawValue: CLibC.IPPROTO_FRAGMENT)
	public static let RSVP     = SocketProtocol(rawValue: CLibC.IPPROTO_RSVP)
	public static let GRE      = SocketProtocol(rawValue: CLibC.IPPROTO_GRE)
	public static let ESP      = SocketProtocol(rawValue: CLibC.IPPROTO_ESP)
	public static let AH       = SocketProtocol(rawValue: CLibC.IPPROTO_AH)
	public static let ICMPv6   = SocketProtocol(rawValue: CLibC.IPPROTO_ICMPV6)
	public static let None     = SocketProtocol(rawValue: CLibC.IPPROTO_NONE)
	public static let DSTOPTS  = SocketProtocol(rawValue: CLibC.IPPROTO_DSTOPTS)
	public static let MTP      = SocketProtocol(rawValue: CLibC.IPPROTO_MTP)
	public static let ENCAP    = SocketProtocol(rawValue: CLibC.IPPROTO_ENCAP)
	public static let PIM      = SocketProtocol(rawValue: CLibC.IPPROTO_PIM)
	public static let SCTP     = SocketProtocol(rawValue: CLibC.IPPROTO_SCTP)
	public static let RAW      = SocketProtocol(rawValue: CLibC.IPPROTO_RAW)
	public static let MAX      = SocketProtocol(rawValue: CLibC.IPPROTO_MAX)
	
	public typealias RawValue = Int32
	public var rawValue: RawValue
	
	#if os(Linux)
	private init(rawValue: Int) {
		self.rawValue = Int32(rawValue)
	}
	#endif
	
	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}
