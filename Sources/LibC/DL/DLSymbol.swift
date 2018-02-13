//
//  DLSymbol.swift
//  LibC
//

public struct DLSymbol {
	internal let symbol: UnsafeMutableRawPointer
	
	public func `as`<T>(_ type: T.Type) -> T {
		return unsafeBitCast(self.symbol, to: type)
	}
}
