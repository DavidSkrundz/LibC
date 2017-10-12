//
//  InterfaceStatus.swift
//  LibC
//

public struct InterfaceStatus {
	public let isUp: Bool
	public let isLoopback: Bool
	
	internal init(isUp: Bool, isLoopback: Bool) {
		self.isUp = isUp
		self.isLoopback = isLoopback
	}
}
