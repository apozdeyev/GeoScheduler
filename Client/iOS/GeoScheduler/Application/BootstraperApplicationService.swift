//
//  BootstraperApplicationService.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import PluggableApplicationDelegate
import Swinject
import SwinjectStoryboard
import Model
import ViewModel
import View

final class BootstraperApplicationService: NSObject, ApplicationService {
	var window: UIWindow?
	let container = Container() { container in
//		// Models
//		container.register(Modeling.self) { _ in Model() }
//
//		// View models
//		container.register(ViewModeling.self) { r in
//			r.resolve(ViewModel.self)!
//		}
//		container.register(ViewModeling.self) { r in
//			let viewModel = ViewModel(model: r.resolve(Modeling.self)!)
//			return viewModel
//		}.inObjectScope(.container)
//
//		// Views
//		container.storyboardInitCompleted(ViewController.self) { r, c in
//			c.viewModel = r.resolve(ViewModeling.self)!
//		}
//
//		// It is a workaround of unexpected log messages (https://github.com/Swinject/Swinject/issues/218).
//		Container.loggingFunction = nil
	}
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.backgroundColor = UIColor.white
		window.makeKeyAndVisible()
		self.window = window
		
		let bundle = Bundle(for: ViewController.self)
		let storyboard = SwinjectStoryboard.create(name: "Main", bundle: bundle, container: container)
		window.rootViewController = storyboard.instantiateInitialViewController()
		
		return true
	}
}
