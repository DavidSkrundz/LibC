// swift-tools-version:4.1
//
//  Package.swift
//  LibC
//

import PackageDescription

let package = Package(
	name: "LibC",
	products: [
		.library(
			name: "LibC",
			targets: ["LibC"]),
		.library(
			name: "sLibC",
			type: .static,
			targets: ["LibC"]),
		.library(
			name: "dLibC",
			type: .dynamic,
			targets: ["LibC"])
	],
	targets: [
		.target(
			name: "LibC",
			dependencies: ["CLibC"]),
		.testTarget(
			name: "LibCTests",
			dependencies: ["LibC"]),
		.target(
			name: "CLibC",
			dependencies: ["CLibBSD"]),
		.target(
			name: "CLibBSD",
			dependencies: [])
	]
)
