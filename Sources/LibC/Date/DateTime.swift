//
//  DateTime.swift
//  LibC
//

import CLibC

public struct DateTime {
	private let c_tm: tm
	public let date: Date
	public let time: Time
	public let timezone: Timezone
	
	/// Create a new `DateTime` with the current date and time
	public init() {
		self.c_tm = DateTime.currentDateTime()
		var time = timeval()
		gettimeofday(&time, nil)
		
		self.date = Date(self.c_tm)
		self.time = Time(self.c_tm, time)
		self.timezone = Timezone(self.c_tm)
	}
	
	internal static func currentDateTime() -> tm {
		var rawTime = CLibC.time(nil)
		let timeInfoPointer = localtime(&rawTime)!
		return timeInfoPointer.pointee
	}
	
	/// - Returns: The `asctime()` `String` representation of the `DateTime`
	///            Example: `Sat Jul 30 21:00:50 2016\n`
	public var cDescription: String {
		var tm = self.c_tm
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
