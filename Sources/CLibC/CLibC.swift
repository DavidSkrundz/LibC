//
//  CLibC.swift
//  CLibC
//

#if os(Linux)
	@_exported import Glibc
	
	@_exported import CLibBSD
#endif

#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
	@_exported import Darwin.C
#endif
