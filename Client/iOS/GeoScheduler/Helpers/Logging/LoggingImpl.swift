//
//  LoggingImpl.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import CocoaLumberjackSwift


public final class LoggingImpl: Logging {

	public init() {
		DDLog.add(DDTTYLogger.sharedInstance) // TTY = Xcode console
		DDTTYLogger.sharedInstance.logFormatter = CustomCocoaLumberjackFormatter();

	}

	public func debug(_ message: String, file: StaticString, function: StaticString, line: UInt) {
		DDLogDebug(message, file: file, function: function, line: line);
	}

	public func info(_ message: String, file: StaticString, function: StaticString, line: UInt) {
		DDLogInfo(message, file: file, function: function, line: line);
	}

	public func warn(_ message: String, file: StaticString, function: StaticString, line: UInt) {
		DDLogWarn(message, file: file, function: function, line: line);
	}

	public func error(_ message: String, file: StaticString, function: StaticString, line: UInt) {
		DDLogError(message, file: file, function: function, line: line);
	}
}
