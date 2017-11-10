//
//  Logger.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

fileprivate var logger: Logging? = LoggingImpl()

public func LogDebug(_ message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
	logger?.debug(message, file: file, function: function, line: line)
}

public func LogInfo(_ message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
	logger?.info(message, file: file, function: function, line: line)
}

public func LogWarn(_ message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
	logger?.warn(message, file: file, function: function, line: line)
}

public func LogError(_ message: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) {
	logger?.error(message, file: file, function: function, line: line)
}
