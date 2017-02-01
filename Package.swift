//
//  Package.swift
//  LibC
//

import PackageDescription

let package = Package(
	name: "LibC",
	dependencies: [
		.Package(url: "https://github.com/DavidSkrundz/CLibC.git", majorVersion: 1, minor: 0),
		.Package(url: "https://github.com/DavidSkrundz/UnicodeOperators.git", majorVersion: 1, minor: 0),
	]
)

let staticLibrary = Product(
	name: "LibC",
	type: .Library(.Static),
	modules: ["LibC"]
)
let dynamicLibrary = Product(
	name: "LibC",
	type: .Library(.Dynamic),
	modules: ["LibC"]
)

products.append(staticLibrary)
products.append(dynamicLibrary)
