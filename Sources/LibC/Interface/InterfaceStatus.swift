//
//  InterfaceStatus.swift
//  LibC
//

public struct InterfaceStatus {
	internal(set) public var isUp: Bool
	internal(set) public var isLoopback: Bool
	
	internal init() {
		self.isUp = false
		self.isLoopback = false
	}
}
