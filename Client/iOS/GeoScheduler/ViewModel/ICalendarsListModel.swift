//
//  CalendarsListViewModel.swift
//  ViewModel
//
//  Created by Anatoliy Pozdeyev on 18/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import ReactiveSwift
import Model
import Result

public protocol ICalendarsListModel {
	var isAccesToCalendarGranted: Property<Bool> { get }
	var Calendars: Property<[CalendarEntity]> { get }
	
	var requestAccesToCalendar: Action<(), Bool, AnyError> { get }
}
