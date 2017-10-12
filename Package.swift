// swift-tools-version:4.0
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
			type: .static,
			targets: ["LibC"]),
		.library(
			name: "LibC",
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
