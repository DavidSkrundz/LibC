//
//  Timezone.swift
//  LibC
//

import CLibC

public struct Timezone {
	public let timezoneInfo: TimezoneInfo
	
	/// Create a new `Timezone` instance with the current time
	public init() {
		let tm = DateTime.currentDateTime()
		timezoneInfo = TimezoneInfo(gmtOffset: tm.tm_gmtoff,
									isDaylightSavings: tm.tm_isdst > 0,
									abbreviation: String(cString: tm.tm_zone))
	}
	
	internal init(_ time: tm) {
		timezoneInfo = TimezoneInfo(gmtOffset: time.tm_gmtoff,
		                            isDaylightSavings: time.tm_isdst > 0,
		                            abbreviation: String(cString: time.tm_zone))
	}
}

extension Timezone: CustomStringConvertible {
	public var description: String {
		return "\(self.timezoneInfo.abbreviation)"
	}
}
