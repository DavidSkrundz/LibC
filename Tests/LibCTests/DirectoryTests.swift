//
//  DirectoryTests.swift
//  LibCTests
//

import XCTest
import LibC

class DirectoryTests: XCTestCase {
	func testDirectory() {
		print(Directory.current())
		do {
			try Directory.change(to: "..")
		} catch {}
		print(Directory.current())
	}
	
	static var allTests = [
		("testDirectory", testDirectory)
	]
}
