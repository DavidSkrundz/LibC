//
//  DateInfo.swift
//  LibC
//

public struct DateInfo {
	/// The day of the month [1-31]
	public let day: UInt8
	/// The day of the year [0-365]
	public let yearDay: UInt16
	
	public let weekDay: Day
	public let month: Month
	public let year: Int
	
	/// Create a new `DateInfo`
	///
	/// - Precondition: `day ∈ [1-31]`
	/// - Precondition: `yearDay ∈ [0-365]`
	internal init(day: UInt8,
	              weekDay: Day,
	              yearDay: UInt16,
	              month: Month,
	              year: Int) {
		precondition(day >= 1)
		precondition(day <= 31)
		precondition(yearDay >= 0)
		precondition(yearDay <= 365)
		
		self.day = day
		self.weekDay = weekDay
		self.yearDay = yearDay
		self.month = month
		self.year = year + 1900
	}
}

extension DateInfo: CustomStringConvertible {
	public var description: String {
		return [
			"\(self.weekDay)",
			"\(self.month)",
			"\(self.day)",
			"\(self.year)"
			].joined(separator: " ")
	}
}
