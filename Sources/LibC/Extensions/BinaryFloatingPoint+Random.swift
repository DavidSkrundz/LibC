//
//  BinaryFloatingPoint+Random.swift
//  LibC
//

extension BinaryFloatingPoint {
	/// Generate a random number in `(0.0...1.0)`
	///
	/// - Returns: A random number
	public static func random() -> Self {
		let random = Float80(UInt64.random())
		let max = Float80(UInt64.max)
		return Self(random / max)
	}
}
