//
//  Address.swift
//  LibC
//

public struct Address {
	internal(set) public var ip: String
	internal(set) public var mask: String
	
	internal init() {
		self.ip = ""
		self.mask = ""
	}
}
