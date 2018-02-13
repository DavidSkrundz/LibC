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
	
	/// Get a symbol from a library
	///
	/// - Throws: `DLError.symbol`
	public static func symbol(handle: DLHandle,
							  name: String) throws -> DLSymbol {
		let sym = dlsym(handle.handle, name)
		guard let symbol = sym else {
			if let errorString = dlerror() {
				throw DLError.symbol(String(cString: errorString))
			}
			throw DLError.symbol("Unknown error")
		}
		return DLSymbol(symbol: symbol)
	}
	
	/// Close a dynamic library
	///
	/// - Throws: `DLError.close`
	public static func close(handle: DLHandle) throws {
		let close = dlclose(handle.handle)
		if close != 0 {
			if let errorString = dlerror() {
				throw DLError.close(String(cString: errorString))
			}
			throw DLError.close("Unknown error")
		}
	}
	
}
