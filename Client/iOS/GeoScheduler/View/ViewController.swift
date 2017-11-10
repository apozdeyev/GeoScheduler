//
//  ViewController.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import UIKit
import ViewModel
import Helpers

public final class ViewController: UIViewController {

	@IBOutlet var label: UILabel!
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		
		LogDebug("ViewController loaded")
		
		label.text = viewModel?.test
	}
	
	public var viewModel: ViewModeling?
	
	@IBAction func onCrashButtonTapped() {
		crash()
	}
	
	fileprivate func crash() -> Never {
		fatalError("test crash")
	}
}

