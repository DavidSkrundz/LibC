//
//  DirectoryError.swift
//  LibC
//

public enum DirectoryError: Error {
	case permissionDenied
	case pathOutsideAddressableSpace
	case iOError
	case tooManySymbolicLinks
	case pathTooLong
	case fileDoesNotExist
	case insufficienKernelMemory
	case notADirectory
}
