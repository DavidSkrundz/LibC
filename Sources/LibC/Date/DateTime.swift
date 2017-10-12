//
//  DateTime.swift
//  LibC
//

import CLibC

public struct DateTime {
	private let ctm: tm
	public let date: Date
	public let time: Time
	public let timezone: Timezone
	
	/// Create a new `DateTime` with the current date and time
	public init() {
		self.ctm = DateTime.currentDateTime()
		var time = timeval()
		gettimeofday(&time, nil)
		
		self.date = Date(self.ctm)
		self.time = Time(self.ctm, time)
		self.timezone = Timezone(self.ctm)
	}
	
	internal static func currentDateTime() -> tm {
		var rawTime = CLibC.time(nil)
		let timeInfoPointer = localtime(&rawTime)!
		return timeInfoPointer.pointee
	}
	
	/// - Returns: The `asctime()` `String` representation of the `DateTime`
	///            Example: `Sat Jul 30 21:00:50 2016\n`
	public var cDescription: String {
		var tm = self.ctm
		return String(cString: asctime(&tm))
	}
}

extension DateTime: CustomStringConvertible {
	/// - Returns: The full `String` representation of the `DateTime`
	///            Example: `Sat Jul 30 2016 21:00:50 MST`
	public var description: String {
		return [
			"\(self.date)",
			"\(self.time)",
			"\(self.timezone)"
			].joined(separator: " ")
	}
}
