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
		// Models
		container.register(ICalendarProxy.self) { _ in
			CalendarProxy()
		}

		// View models
		container.register(ICalendarsListModel.self) { r in
			let viewModel = CalendarsListModel(calendarProxy: r.resolve(ICalendarProxy.self)!)
			return viewModel
		}.inObjectScope(.container)

		// TODO:
//		container.register(ICalendarEventsListModel.self) { r in
//			let viewModel = CalendarEventsListModel(calendarProxy: r.resolve(ICalendarProxy.self)!, )
//			return viewModel
//		}.inObjectScope(.container)

		// Views
		container.storyboardInitCompleted(CalendarsListVC.self) { r, c in
			c.viewModel = r.resolve(ICalendarsListModel.self)!
		}

		// It is a workaround of unexpected log messages (https://github.com/Swinject/Swinject/issues/218).
		Container.loggingFunction = nil
	}


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.backgroundColor = UIColor.white
		window.makeKeyAndVisible()
		self.window = window

		let bundle = Bundle(for: CalendarsListVC.self)
		let storyboard = SwinjectStoryboard.create(name: "Main", bundle: bundle, container: container)
		window.rootViewController = storyboard.instantiateInitialViewController()

		return true
	}
}
