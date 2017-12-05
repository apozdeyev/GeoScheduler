//
// Created by Anatoliy Pozdeyev on 12/11/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import ReactiveSwift
import EventKit
import Result

public class CalendarProxy: ICalendarProxy {

	public var eventStore = EKEventStore()

	public init() {
		// nothing
	}

	public func isAccesToCalendarGranted() -> Bool {
		let isAccesToCalendarGranted = EKEventStore.authorizationStatus(for: .event) == EKAuthorizationStatus.authorized
		return isAccesToCalendarGranted

	}

	public func requestAccesToCalendar() -> SignalProducer<Bool, AnyError> {
		return SignalProducer { [weak self] (observer, disposable) in
			guard let strongSelf = self else {
				return
			}

			strongSelf.eventStore.requestAccess(to: .event) { isGranted, error in
				observer.send(value: isGranted)
				observer.sendCompleted()
			}
		}
	}


	public func requestCalendars() -> SignalProducer<[CalendarEntity], AnyError> {
		return SignalProducer { [weak self] (observer, disposable) in
			guard let strongSelf = self else {
				return
			}

			let calendars = strongSelf.eventStore.calendars(for: .event).map {
				$0.convertToModelEntity()
			}
			observer.send(value: calendars)
			observer.sendCompleted()
		}
	}
}


extension EKCalendar {
	public func convertToModelEntity() -> CalendarEntity {
		let calendarEntity = CalendarEntity(calendarIdentifier: self.calendarIdentifier, title: self.title)
		return calendarEntity
	}
}
