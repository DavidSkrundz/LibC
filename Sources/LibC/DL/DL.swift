//
//  DL.swift
//  LibC
//

import CLibC

/// Provides access to the dynamic linker
public struct DL {
	/// Open a dynamic library
	///
	/// - Parameter path: The path to the library or `nil` to get a handle to
	///                   this executable
	///
	/// - Throws: `DLError.open`
	public static func open(path: String?,
							mode: DLOpenMode) throws -> DLHandle {
		let dl = dlopen(path, mode.value)
		guard let handle = dl else {
			if let errorString = dlerror() {
				throw DLError.open(String(cString: errorString))
			}
			throw DLError.open("Unknown error")
		}
		return DLHandle(handle: handle)
	}
}
