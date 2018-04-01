//
//  DLHandle.swift
//  LibC
//

import CLibC

public struct DLHandle {
	private let handle: UnsafeMutableRawPointer
	private var closed = false
	
	internal init(handle: UnsafeMutableRawPointer) {
		self.handle = handle
	}
	
	/// Get a symbol from a library
	///
	/// - Throws: `DLError.symbol`
	public func symbol(name: String) throws -> DLSymbol {
		if self.closed { throw DLError.symbol("DLHandle is closed") }
		let sym = dlsym(self.handle, name)
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
	public mutating func close() throws {
		if self.closed { throw DLError.symbol("DLHandle already closed") }
		self.closed = true
		let close = dlclose(self.handle)
		if close != 0 {
			if let errorString = dlerror() {
				throw DLError.close(String(cString: errorString))
			}
			throw DLError.close("Unknown error")
		}
	}
}
