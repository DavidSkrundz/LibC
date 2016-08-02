//
//  DateTime.swift
//  LibC
//

import CLibC

public struct DateTime {
	fileprivate let tm: CLibC.tm
	public let date: Date
	public let time: Time
	public let timezone: Timezone
	public let timeval: timeval
	
	/// Create a new `DateTime` with the current date and time
	public init() {
		self.tm = DateTime.currentDateTime()
		var time = CLibC.timeval()
		gettimeofday(&time, nil)
		
		self.date = Date(self.tm)
		self.time = Time(self.tm, time)
		self.timezone = Timezone(self.tm)
		self.timeval = time
	}
}

extension DateTime: CustomStringConvertible {
	/// - Returns: The `asctime()` `String` representation of the `DateTime`
	///            Example: `Sat Jul 30 21:00:50 2016\n`
	public var cDescription: String {
		var tm = self.tm
		return String(cString: asctime(&tm))
	}
	
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

extension DateTime {
	public static func currentDateTime() -> CLibC.tm {
		var rawTime = CLibC.time(nil)
		let timeInfoPointer = localtime(&rawTime)!
		return timeInfoPointer.move()
	}
}
