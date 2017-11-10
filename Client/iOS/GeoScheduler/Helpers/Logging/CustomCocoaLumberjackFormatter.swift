//
//  CustomCocoaLumberjackFormatter.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import CocoaLumberjack

public class CustomCocoaLumberjackFormatter: NSObject, DDLogFormatter {
	
	let dateFormmater = DateFormatter()
	
	public override init() {
		super.init()
		dateFormmater.dateFormat = "yyyy/MM/dd HH:mm:ss:SSS"
	}
	
	//MARK: - DDLogFormatter
	public func format(message: DDLogMessage) -> String? {
		
		let logLevel: String
		switch message.flag {
			case DDLogFlag.error:
				logLevel = "ERROR"
			case DDLogFlag.warning:
				logLevel = "WARNING"
			case DDLogFlag.info:
				logLevel = "INFO"
			case DDLogFlag.debug:
				logLevel = "DEBUG"
			default:
				logLevel = "VERBOSE"
		}
		
		let dt = dateFormmater.string(from: message.timestamp)
		let logMsg = message.message
		let lineNumber = message.line
		let file = message.fileName
		let functionName = message.function
		let threadId = message.threadID
		
		return "\(dt) [\(threadId)] [\(logLevel)] [\(file):\(lineNumber)] \(functionName ?? "") - \(logMsg)"
	}
}
