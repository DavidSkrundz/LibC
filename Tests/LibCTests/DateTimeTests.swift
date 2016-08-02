//
//  DateTimeTests.swift
//  LibC
//

@testable import LibC
import XCTest

class DateTimeTests: XCTestCase {
	func testCDescription() {
		let dateTime = DateTime()
		print(dateTime.cDescription)
		XCTAssertEqual(dateTime.cDescription.characters.count, 25)
	}
	
	func testDescription() {
		let dateTime = DateTime()
		print(dateTime.description)
		XCTAssertGreaterThanOrEqual(dateTime.description.characters.count, 27)
		XCTAssertLessThanOrEqual(dateTime.description.characters.count, 28)
	}
	
	static var allTests = [
		("testCDescription", testCDescription),
		("testDescription", testDescription),
	]
}
