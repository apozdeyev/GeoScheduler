//
//  ViewModel.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Model

public final class ViewModel: ViewModeling {
	public private(set) var test: String
	
	public init(model: Modeling) {
		self.test = model.test()
	}
}
