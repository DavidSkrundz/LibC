//
//  TimeInfo.swift
//  LibC
//

import UnicodeOperators

public struct TimeInfo {
	/// The number of hours since midnight [0-23]
	public let hours: UInt8
	
	/// The number of minutes after the hour [0-59]
	public let minutes: UInt8
	
	/// The number of seconds after the minute [0-60]
	public let seconds: UInt8
	
	/// Create a new `TimeInfo`
	///
	/// - Precondition: `hours ∈ [0-23]`
	/// - Precondition: `minutes ∈ [0-59]`
	/// - Precondition: `seconds ∈ [0-60]`
	public init(hours: UInt8, minutes: UInt8, seconds: UInt8) {
		precondition(hours ≥ 0)
		precondition(hours ≤ 23)
		precondition(minutes ≥ 0)
		precondition(minutes ≤ 59)
		precondition(seconds ≥ 0)
		precondition(seconds ≤ 60)
		
		self.hours = hours
		self.minutes = minutes
		self.seconds = seconds
	}
}
