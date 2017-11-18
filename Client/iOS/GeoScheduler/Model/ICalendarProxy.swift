//
// Created by Anatoliy Pozdeyev on 12/11/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import ReactiveSwift
import Result

public protocol ICalendarProxy {
	func isAccesToCalendarGranted() -> Bool
	
	func requestAccesToCalendar() -> SignalProducer<Bool, AnyError>
	
	func requestCalendars() -> SignalProducer<[ CalendarEntity ], AnyError>
}
