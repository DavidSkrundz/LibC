//
//  Directory.swift
//  LibC
//

import CLibC

public struct Directory {
	public static func ChangeDirectory(to directory: String) throws {
		if chdir(directory) == 0 { return }
		switch errno {
			case EACCES:       throw DirectoryError.PermissionDenied
			case EFAULT:       throw DirectoryError.PathOutsideAddressableSpace
			case EIO:          throw DirectoryError.IOError
			case ELOOP:        throw DirectoryError.TooManySymbolicLinks
			case ENAMETOOLONG: throw DirectoryError.PathTooLong
			case ENOENT:       throw DirectoryError.FileDoesNotExist
			case ENOMEM:       throw DirectoryError.InsufficienKernelMemory
			case ENOTDIR:      throw DirectoryError.NotADirectory
			default: fatalError("Unexpected return code: \(errno)")
		}
	}
	
	public static func CurrentDirectory() -> String {
		let maxPathLength = pathconf(".", Int32(_PC_PATH_MAX))
		let pathLength: Int = maxPathLength == -1 ? 1024 : maxPathLength
		
		var buffer = [Int8](repeating: 0, count: pathLength)
		let bufferPointer = buffer.withUnsafeMutableBufferPointer {
			$0.baseAddress
		}
		
		let outPointer = getcwd(bufferPointer, pathLength)
		
		if outPointer != bufferPointer {
			return ""
		}
		
		return buffer
			.map { UInt8($0) }
			.map { UnicodeScalar($0) }
			.map { Character($0) }
			.reduce("") { "\($0)\($1)" }
	}
}
