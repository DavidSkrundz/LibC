//
//  DirectoryError.swift
//  LibC
//

public enum DirectoryError: Error {
	case PermissionDenied
	case PathOutsideAddressableSpace
	case IOError
	case TooManySymbolicLinks
	case PathTooLong
	case FileDoesNotExist
	case InsufficienKernelMemory
	case NotADirectory
}
