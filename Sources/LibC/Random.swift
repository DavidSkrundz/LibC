//
//  Random.swift
//  LibC
//

import CLibC

public struct Random {
	/// - Precondition: `T` is not a `UInt32`
	///
	/// - Returns: A random number within `0...T.max`
	fileprivate static func randomInteger<T: MaxableInteger>() -> T {
		return T(arc4random_uniform(Swift.UInt32(T.max.toIntMax() + 1)))
	}
	
	/// - Returns: A random number within `0..<max`
	fileprivate static func randomInteger<T: MaxableInteger>(_ max: T) -> T {
		return T(arc4random_uniform(Swift.UInt32(max.toIntMax())))
	}
}

// MARK: Random Signed
extension Random {
	/// Returns: A random `Int`
	public static func Int() -> Int {
		return Random.randomInteger()
	}
	
	/// Returns: A random `Int8`
	public static func Int8() -> Int8 {
		return Random.randomInteger()
	}
	
	/// Returns: A random `Int16`
	public static func Int16() -> Int16 {
		return Random.randomInteger()
	}
	
	/// Returns: A random `Int32`
	public static func Int32() -> Int32 {
		return Random.randomInteger()
	}
}

// MARK: Random Unsigned
extension Random {
	/// Returns: A random `UInt`
	public static func UInt() -> UInt {
		return Random.randomInteger()
	}
	
	/// Returns: A random `UInt8`
	public static func UInt8() -> UInt8 {
		return Random.randomInteger()
	}
	
	/// Returns: A random `UInt16`
	public static func UInt16() -> UInt16 {
		return Random.randomInteger()
	}
	
	/// Returns: A random `UInt32`
	public static func UInt32() -> UInt32 {
		return arc4random()
	}
}

// MARK: Ranged Signed
extension Random {
	/// - Returns: A random `Int` within `0..<max`
	public static func Int(_ max: Int) -> Int {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `Int8` within `0..<max`
	public static func Int8(_ max: Int8) -> Int8 {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `Int16` within `0..<max`
	public static func Int16(_ max: Int16) -> Int16 {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `Int32` within `0..<max`
	public static func Int32(_ max: Int32) -> Int32 {
		return Random.randomInteger(max)
	}
}

// MARK: Ranged Unsigned
extension Random {
	/// - Returns: A random `UInt` within `0..<max`
	public static func UInt(_ max: UInt) -> UInt {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `UInt8` within `0..<max`
	public static func UInt8(_ max: UInt8) -> UInt8 {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `UInt16` within `0..<max`
	public static func UInt16(_ max: UInt16) -> UInt16 {
		return Random.randomInteger(max)
	}
	
	/// - Returns: A random `UInt32` within `0..<max`
	public static func UInt32(_ max: UInt32) -> UInt32 {
		return Random.randomInteger(max)
	}
}
