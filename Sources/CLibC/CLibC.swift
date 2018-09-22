//
//  CLibC.swift
//  CLibC
//

#if os(Linux)
	@_exported import Glibc
#endif

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
	@_exported import Darwin.C
#endif
