//
//  AppDelegate.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import UIKit
import PluggableApplicationDelegate
import Helpers


@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {
	
	override var services: [ApplicationService] {
		return [
			BootstraperApplicationService()
			, FirebaseApplicationService()
		]
	}
}

