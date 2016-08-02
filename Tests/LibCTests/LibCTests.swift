//
//  LibCTests.swift
//  LibC
//

@testable import LibC
import XCTest

class LibCTests: XCTestCase {
	func testMAC() {
		Interface.Interfaces().forEach { print($0) }
	}
	
	func testDirectory() {
		print(Directory.CurrentDirectory())
		do {
			try Directory.ChangeDirectory(to: "..")
		} catch {}
		print(Directory.CurrentDirectory())
	}
	
	static var allTests = [
		("testMAC", testMAC),
		("testDirectory", testDirectory),
	]
}
