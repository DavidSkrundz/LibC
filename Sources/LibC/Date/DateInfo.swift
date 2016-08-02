//
//  DateInfo.swift
//  LibC
//

import UnicodeOperators

public struct DateInfo {
	/// The day of the month [1-31]
	public let day: UInt8
	
	/// The day of the week
	public let weekDay: Day
	
	/// The day of the year [0-365]
	public let yearDay: UInt16
	
	public let month: Month
	public let year: Int
	
	/// Create a new `DateInfo`
	///
	/// - Precondition: `day ∈ [1-31]`
	/// - Precondition: `yearDay ∈ [0-365]`
	init(day: UInt8, weekDay: Day, yearDay: UInt16, month: Month, year: Int) {
		precondition(day ≥ 1)
		precondition(day ≤ 31)
		precondition(yearDay ≥ 0)
		precondition(yearDay ≤ 365)
		
		self.day = day
		self.weekDay = weekDay
		self.yearDay = yearDay
		self.month = month
		self.year = year + 1900
	}
}
