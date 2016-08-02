//
//  IntegerMaxExtension.swift
//  LibC
//

internal protocol MaxableInteger {
	init(_ value: UInt32)
	
	static var max: Self { get }
	
	func toIntMax() -> IntMax
}

extension Int: MaxableInteger {}
extension Int8: MaxableInteger {}
extension Int16: MaxableInteger {}
extension Int32: MaxableInteger {}
extension Int64: MaxableInteger {}

extension UInt: MaxableInteger {}
extension UInt8: MaxableInteger {}
extension UInt16: MaxableInteger {}
extension UInt32: MaxableInteger {}
extension UInt64: MaxableInteger {}
