//
//  Address.swift
//  LibC
//

public struct Address {
	public let ipAddress: String
	public let mask: String
	
	internal init(ip ipAddress: String, mask: String) {
		self.ipAddress = ipAddress
		self.mask = mask
	}
}
