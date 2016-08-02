//
//  TimezoneInfo.swift
//  LibC
//

public struct TimezoneInfo {
	/// In seconds
	public let gmtOffset: Int
	public let isDaylightSavings: Bool
	public let abbreviation: String
}
