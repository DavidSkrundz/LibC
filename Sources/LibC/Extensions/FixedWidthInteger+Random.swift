//
//  FixedWidthInteger+Random.swift
//  LibC
//

import CLibC

extension FixedWidthInteger {
	/// Generate a random number in `(T.min...T.max)`
	///
	/// - Returns: A random integer
	public static func random() -> Self {
		var number = Self(0)
		arc4random_buf(&number, MemoryLayout<Self>.size)
		return number
	}
	
	/// Generate a random number in `(T.min..<max)`
	///
	/// - Parameter max: The upper bound of the random number
	///
	/// - Returns: A random integer
	public static func random(max: Self) -> Self {
		let range = Self.max - (Self.max % max)
		var number = Self(0)
		repeat {
			arc4random_buf(&number, MemoryLayout<Self>.size)
		} while number >= range
		return number % max
	}
}
