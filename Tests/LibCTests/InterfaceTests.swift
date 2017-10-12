//
//  InterfaceTests.swift
//  LibCTests
//

import XCTest
import LibC

class InterfaceTests: XCTestCase {
	func testMAC() {
		Interface.interfaces().forEach { print($0) }
	}
	
	static var allTests = [
		("testMAC", testMAC)
	]
}
