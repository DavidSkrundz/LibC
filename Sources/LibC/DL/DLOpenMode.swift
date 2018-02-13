//
//  DLOpenMode.swift
//  LibC
//

import CLibC

public enum DLOpenMode {
	case lazy
	case now
	case local
	case global
	case noLoad
	case noDelete
	
	internal var value: Int32 {
		switch self {
			case .lazy:     return RTLD_LAZY
			case .now:      return RTLD_NOW
			case .local:    return RTLD_LOCAL
			case .global:   return RTLD_GLOBAL
			case .noLoad:   return RTLD_NOLOAD
			case .noDelete: return RTLD_NODELETE
		}
	}
}
