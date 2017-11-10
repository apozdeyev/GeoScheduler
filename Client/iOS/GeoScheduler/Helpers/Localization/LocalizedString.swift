//
//  StringLocalized.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 06/09/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation

public func LocalizedString(_ key: String, comment: String) -> String {
	return NSLocalizedString(key, comment: comment);
}
