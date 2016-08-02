//
//  RandomTests.swift
//  LibC
//

@testable import LibC
import XCTest

class RandomTests: XCTestCase {
	func testRandomInt8() {
		for i in 1...Int8.max {
			XCTAssertLessThan(Random.Int8(i), i)
		}
	}
	
	func testRandomUInt8() {
		for i in 1...UInt8.max {
			XCTAssertLessThan(Random.UInt8(i), i)
		}
	}
	
	func testRandomInt32() {
		XCTAssertLessThan(Random.Int32(), Int32.max)
	}
	
	func testRandomUInt32() {
		XCTAssertLessThan(Random.UInt32(), UInt32.max)
	}
	
	static var allTests = [
		("testRandomInt8", testRandomInt8),
		("testRandomUInt8", testRandomUInt8),
		("testRandomInt32", testRandomInt32),
		("testRandomUInt32", testRandomUInt32),
	]
}
