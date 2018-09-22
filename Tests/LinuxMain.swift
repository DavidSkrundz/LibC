//
//  LinuxMain.swift
//  LibC
//

import XCTest
@testable import LibCTests

XCTMain([
	testCase(DateTimeTests.allTests.shuffled()),
	testCase(DirectoryTests.allTests.shuffled()),
	testCase(InterfaceTests.allTests.shuffled()),
	testCase(RandomTests.allTests.shuffled()),
])
