//
//  LinuxMain.swift
//  LibC
//

@testable import LibCTests
import XCTest

XCTMain([
	testCase(DateTimeTests.allTests),
	testCase(LibCTests.allTests),
	testCase(RandomTests.allTests),
])
