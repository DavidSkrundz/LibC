//
//  DateTimeTests.swift
//  LibC
//

import XCTest
import LibC

class DateTimeTests: XCTestCase {
	func testCDescription() {
		let dateTime = DateTime()
		print(dateTime.time.preciseTimeInfo.ticksSince1970)
		print(dateTime.cDescription)
		XCTAssertEqual(dateTime.cDescription.count, 25)
	}
	
	func testDescription() {
		let dateTime = DateTime()
		print(dateTime.description)
		XCTAssertGreaterThanOrEqual(dateTime.description.count, 27)
		XCTAssertLessThanOrEqual(dateTime.description.count, 28)
	}
	
	func testNowInit() {
		_ = LibC.Date()
		_ = Time()
		_ = Timezone()
	}
	
	func testPrintDayMonth() {
		var i = 0
		while let day = Day(rawValue: i) {
			print("Day \(i) = \(day)")
			i += 1
		}
		
		i = 0
		while let month = Month(rawValue: i) {
			print("Month \(i) = \(month)")
			i += 1
		}
	}
	
	static var allTests = [
		("testCDescription", testCDescription),
		("testDescription", testDescription),
		("testNowInit", testNowInit),
		("testPrintDayMonth", testPrintDayMonth)
	]
}
