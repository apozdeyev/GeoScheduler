//
//  ViewController.swift
//  MVVMTemplate
//
//  Created by Anatoliy Pozdeyev on 14/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import UIKit
import ViewModel
import Model
import Helpers
import Eureka
import ReactiveEureka
import ReactiveSwift
import ReactiveCocoa
import Result

extension LabelRow: RowSelecting {}

public class CalendarsListVC: FormViewController {

	public var viewModel: ICalendarsListModel?

	@IBOutlet var noAccessView: UIView!
	@IBOutlet var requestAccessButton: UIButton!

	public override func viewDidLoad() {
		super.viewDidLoad()

		if let viewModel = viewModel {
			viewModel.isAccesToCalendarGranted.producer
					.observe(on: UIScheduler())
					.on(value: {
						self.updateNoAccessViewVisibility(visible: !$0)
					})
					.start()

			requestAccessButton.reactive.pressed = CocoaAction(viewModel.requestAccesToCalendar)
	
			form.reactive.value <~
					viewModel.calendars
							.mapArrayValues { self.calendarRow(cellModel: $0) }
		}
	}

	fileprivate func updateNoAccessViewVisibility(visible: Bool) {
		if (visible) {
			view.addSubview(noAccessView)
		} else {
			noAccessView.removeFromSuperview()
		}
	}

	fileprivate func calendarRow(cellModel: ICalendarCellModel) -> BaseRow {
		return LabelRow() {
			$0.title = cellModel.title
			$0.reactive.selected = CocoaAction(self.buttonaTapAction()) { _ in cellModel }
		}
	}

	fileprivate func buttonaTapAction() -> Action<ICalendarCellModel, Void, NoError> {
		return Action<ICalendarCellModel, Void, NoError> { cellModel in
			return SignalProducer<Void, NoError>( {
				print("Selected row: \(cellModel.title)")
			})
		}
	}
}

