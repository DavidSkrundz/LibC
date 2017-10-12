//
//  LinuxMain.swift
//  LibC
//

import XCTest
@testable import LibCTests

XCTMain([
	testCase(DateTimeTests.allTests),
	testCase(DirectoryTests.allTests),
	testCase(InterfaceTests.allTests),
	testCase(RandomTests.allTests),
])
