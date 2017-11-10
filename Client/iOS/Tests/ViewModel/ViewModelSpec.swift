//
//  ViewModelTests.swift
//  ViewModelTests
//
//  Created by Anatoliy Pozdeyev on 05/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Model

class ViewModelSpec: QuickSpec {
	override func spec() {
		describe("ViewModel") {
			it("method test.") {
				let model = Model()
				
				expect(model).notTo(beNil())
				expect(model.test()) == "test"
			}
		}
	}
}
