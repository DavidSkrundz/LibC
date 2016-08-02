//
//  PrecisionTimeInfo.swift
//  LibC
//

public struct PrecisionTimeInfo {
	public let secondsSince1970: Int
	public let nanosecondsThisSecond: Int32
	
	public init(seconds: Int, nanoseconds: Int32) {
		self.secondsSince1970 = seconds
		self.nanosecondsThisSecond = nanoseconds
	}
}

extension PrecisionTimeInfo {
	public var ticksSince1970: Int64 {
		let secondsPortion = Int64(self.secondsSince1970) * 10_000
		let nsecondsPortion = Int64(self.nanosecondsThisSecond / 100)
		return secondsPortion + nsecondsPortion
	}
}
