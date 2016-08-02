//
//  Time.swift
//  LibC
//

import CLibC
import Foundation // Required for String(format: , _: ...)

public struct Time {
	public let timeInfo: TimeInfo
	public let preciseTimeInfo: PrecisionTimeInfo
	
	/// Create a new `Time` instance with the current time
	public init() {
		let tm = DateTime.currentDateTime()
		self.timeInfo = TimeInfo(hours: UInt8(tm.tm_hour),
		                         minutes: UInt8(tm.tm_min),
		                         seconds: UInt8(tm.tm_sec))
		
		var t = timeval()
		gettimeofday(&t, nil)
		self.preciseTimeInfo = PrecisionTimeInfo(seconds: t.tv_sec,
		                                         nanoseconds: Int32(t.tv_usec))
	}
	
	internal init(_ time: tm, _ t: timeval) {
		self.timeInfo = TimeInfo(hours: UInt8(time.tm_hour),
		                         minutes: UInt8(time.tm_min),
		                         seconds: UInt8(time.tm_sec))
		
		self.preciseTimeInfo = PrecisionTimeInfo(seconds: t.tv_sec,
		                                         nanoseconds: Int32(t.tv_usec))
	}
}

extension Time: CustomStringConvertible {
	// 21:00:50
	public var description: String {
		return [
			String(format: "%02d", self.timeInfo.hours),
			String(format: "%02d", self.timeInfo.minutes),
			String(format: "%02d", self.timeInfo.seconds),
		].joined(separator: ":")
	}
}
