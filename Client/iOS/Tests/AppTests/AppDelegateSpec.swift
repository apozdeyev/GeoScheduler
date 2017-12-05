//
//  HelpersTests.swift
//  HelpersTests
//
//  Created by Anatoliy Pozdeyev on 05/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Quick
import Nimble
import Swinject
import SwinjectStoryboard
import Model
import ViewModel
import View
@testable import MVVMTemplate

class AppDelegateSpec: QuickSpec {
	override func spec() {
		var container: Container!
		beforeEach {
			container = BootstraperApplicationService().container
		}

		describe("Container") {
			it("resolves every service type.") {
				// Models
				expect(container.resolve(Modeling.self)).notTo(beNil())

				// ViewModels
				expect(container.resolve(ViewModeling.self)).notTo(beNil())
			}
			it("injects view models to views.") {
				let bundle = Bundle(for: CalendarsListVC.self)
				let storyboard = SwinjectStoryboard.create(name: "Main", bundle: bundle, container: container)
				let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
				as! CalendarsListVC
				expect(viewController.viewModel).notTo(beNil())
			}
		}
	}
}

