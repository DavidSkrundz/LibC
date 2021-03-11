//
//  InterfaceTests.swift
//  LibCTests
//

import XCTest
import LibC

final class InterfaceTests: XCTestCase {
	func testMAC() {
		Interface.interfaces().forEach { print($0) }
	}
}
