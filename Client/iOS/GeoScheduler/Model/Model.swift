//
//  Model.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Helpers

public final class Model: Modeling {
	public init() {
		// nothing
	}
	
	public func test() -> String {
		return LocalizedString("test", comment: "model test string")
	}
}

