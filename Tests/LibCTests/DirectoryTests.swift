//
//  DirectoryTests.swift
//  LibCTests
//

import XCTest
import LibC

final class DirectoryTests: XCTestCase {
	func testDirectory() {
		print(Directory.current())
		do {
			try Directory.change(to: "..")
		} catch {}
		print(Directory.current())
	}
}

extension DirectoryTests: TestCase {
	static var allTests = [
		("testDirectory", testDirectory),
	]
}
