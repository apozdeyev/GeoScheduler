//
//  Logging.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

public protocol Logging {
	func debug(_ message: String, file: StaticString, function: StaticString, line: UInt)
	func info(_ message: String, file: StaticString, function: StaticString, line: UInt)
	func warn(_ message: String, file: StaticString, function: StaticString, line: UInt)
	func error(_ message: String, file: StaticString, function: StaticString, line: UInt)
}
