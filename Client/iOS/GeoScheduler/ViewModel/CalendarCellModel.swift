//
//  CalendarCellModel.swift
//  ViewModel
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import Model

// Inherits NSObject to use rac_willDeallocSignal.
public final class CalendarCellModel: NSObject, ICalendarCellModel {
	public let id: String
	public let title: String

	internal init(calendar: CalendarEntity) {
		id = calendar.calendarIdentifier
		title = calendar.title

		super.init()
	}
}
