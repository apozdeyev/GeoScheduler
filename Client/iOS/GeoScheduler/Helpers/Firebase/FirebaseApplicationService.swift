//
//  LoggerApplicationService.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import PluggableApplicationDelegate
import Firebase


// This file is compiled in main app module in order to avoid repeating inclusion which produces problems (https://github.com/firebase/quickstart-ios/issues/231).
public final class FirebaseApplicationService: NSObject, ApplicationService {
	public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {

		FirebaseApp.configure()

		return true
	}
}
