//
//  FixedWidthInteger+Random.swift
//  LibC
//

import CLibC

extension FixedWidthInteger {
	/// - Returns: A random value in `T.min...T.max`
	public static func random() -> Self {
		return Self.random(in: Self.min...self.max)
	}
	
	/// Returns a random value using the generator as a source for randomness
	///
	/// - Returns: A random value in `T.min...T.max`
	public static func random<T: RandomNumberGenerator>(using: inout T) -> Self {
		return Self.random(in: Self.min...self.max, using: &using)
	}
}
