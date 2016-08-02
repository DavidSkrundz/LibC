//
//  Date.swift
//  LibC
//

import CLibC

public struct Date {
	public let dateInfo: DateInfo
	
	/// Create a new `Date` with the current date
	public init() {
		let tm = DateTime.currentDateTime()
		self.dateInfo = DateInfo(day: UInt8(tm.tm_mday),
		                         weekDay: Day(rawValue: Int(tm.tm_wday))!,
		                         yearDay: UInt16(tm.tm_yday),
		                         month: Month(rawValue: Int(tm.tm_mon))!,
		                         year: Int(tm.tm_year)
		)
	}
	
	internal init(_ time: tm) {
		self.dateInfo = DateInfo(day: UInt8(time.tm_mday),
		                         weekDay: Day(rawValue: Int(time.tm_wday))!,
		                         yearDay: UInt16(time.tm_yday),
		                         month: Month(rawValue: Int(time.tm_mon))!,
		                         year: Int(time.tm_year)
		)
	}
}

extension Date: CustomStringConvertible {
	// `Sat Jul 30 2016`
	public var description: String {
		return [
			"\(self.dateInfo.weekDay)",
			"\(self.dateInfo.month)",
			"\(self.dateInfo.day)",
			"\(self.dateInfo.year)",
		].joined(separator: " ")
	}
}
