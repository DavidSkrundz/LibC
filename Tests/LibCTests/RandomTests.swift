//
//  RandomTests.swift
//  LibC
//

import XCTest
import LibC

final class RandomTests: XCTestCase {
	func testRandom() {
		_ = Int8.random()
	}
}
