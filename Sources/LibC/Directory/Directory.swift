//
//  Directory.swift
//  LibC
//

import CLibC

public struct Directory {
	/// Change working directory to the one specified
	///
	/// - Parameter directory: The directory to change to
	///
	/// - Throws: `DirectoryError`
	public static func change(to directory: String) throws {
		if chdir(directory) == 0 { return }
		switch errno {
			case EACCES:       throw DirectoryError.permissionDenied
			case EFAULT:       throw DirectoryError.pathOutsideAddressableSpace
			case EIO:          throw DirectoryError.iOError
			case ELOOP:        throw DirectoryError.tooManySymbolicLinks
			case ENAMETOOLONG: throw DirectoryError.pathTooLong
			case ENOENT:       throw DirectoryError.fileDoesNotExist
			case ENOMEM:       throw DirectoryError.insufficienKernelMemory
			case ENOTDIR:      throw DirectoryError.notADirectory
			default: fatalError("Unexpected return code: \(errno)")
		}
	}
	
	/// - Returns: The current working directory
	public static func current() -> String {
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
