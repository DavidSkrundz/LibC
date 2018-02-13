//
//  DLError.swift
//  LibC
//

public enum DLError: Error {
	case open(String)
	case symbol(String)
	case close(String)
	
	public var localizedDescription: String {
		switch self {
			case .open(let string):   return "DL.open: " + string
			case .symbol(let string): return "DL.symbol: " + string
			case .close(let string):  return "DL.close: " + string
		}
	}
}
