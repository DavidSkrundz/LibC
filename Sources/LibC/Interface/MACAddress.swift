//
//  MACAddress.swift
//  LibC
//

import Foundation // Required for String(format: , _: ...)

public struct MACAddress: Equatable {
	public static let Nil = MACAddress([0, 0, 0, 0, 0, 0])
	
	public let bytes: [UInt8]
	
	/// Create a new `MACAddress` from the given bytes
	///
	/// - Precondition: `bytes.count == 6`
	internal init(_ bytes: [UInt8]) {
		precondition(bytes.count == 6)
		
		self.bytes = bytes
	}
}

extension MACAddress: CustomStringConvertible {
	public var description: String {
		return self.bytes
			.map { String(format: "%02X", $0) }
			.joined(separator: ":")
	}
}

public func == (lhs: MACAddress, rhs: MACAddress) -> Bool {
	return lhs.bytes == rhs.bytes
}
