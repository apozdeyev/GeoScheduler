//
//  EventsListVC.swift
//  View
//
//  Created by Anatoliy Pozdeyev on 06/12/2017.
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

public class EventsListVC: FormViewController {

	public var calendarId: String?
	public var viewModel: ICalendarEventsListModel?

	public override func viewDidLoad() {
		super.viewDidLoad()

		if let viewModel = viewModel {
			form.reactive.value <~
					viewModel.events
							.mapArrayValues { self.eventRow(cellModel: $0) }
		}
	}

	fileprivate func eventRow(cellModel: IEventCellModel) -> BaseRow {
		return LabelRow() {
			$0.title = cellModel.title
			$0.reactive.selected = CocoaAction(self.buttonaTapAction()) { _ in cellModel }
		}
	}

	fileprivate func buttonaTapAction() -> Action<IEventCellModel, Void, NoError> {
		return Action<IEventCellModel, Void, NoError> { cellModel in
			return SignalProducer<Void, NoError>( {
				print("Selected row: \(cellModel.title)")
			})
		}
	}
}


