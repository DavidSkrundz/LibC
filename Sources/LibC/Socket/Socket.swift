//
//  Socket.swift
//  LibC
//

import CLibC

public class Socket {
	public let cSocket: Int32
	
	public init?(family: AddressFamily,
	             type: SocketType,
	             protocol: SocketProtocol) {
		self.cSocket = CLibC.socket(family.rawValue,
		                            type.rawValue,
		                            `protocol`.rawValue)
		if self.cSocket == -1 { return nil }
	}
	
	deinit {
		close(self.cSocket)
	}
}
