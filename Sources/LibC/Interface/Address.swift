//
//  Address.swift
//  LibC
//

public struct Address {
	public let ip: String
	public let mask: String
	
	internal init(ip: String, mask: String) {
		self.ip = ip
		self.mask = mask
	}
}
