//
//  RandomTests.swift
//  LibC
//

import XCTest
import LibC

class RandomTests: XCTestCase {
	func testRandomInt8() {
		for i in 1...Int8.max {
			XCTAssertLessThan(Int8.random(max: i), i)
		}
	}
	
	func testRandomUInt8() {
		for i in 1...UInt8.max {
			XCTAssertLessThan(UInt8.random(max: i), i)
		}
	}
	
	func testRandomFloat() {
		XCTAssertLessThanOrEqual(Float.random(), 1.0)
	}
	
	static var allTests = [
		("testRandomInt8", testRandomInt8),
		("testRandomUInt8", testRandomUInt8),
		("testRandomFloat", testRandomFloat)
	]
}
