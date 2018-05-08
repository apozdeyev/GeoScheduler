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

	public func requestEventsOfCalendar(calendarId: String) -> SignalProducer<[EventEntity], AnyError> {
		return SignalProducer { [weak self] (observer, disposable) in
			guard let strongSelf = self else {
				return
			}

			if let calendar = strongSelf.getCalendarById(calendarId: calendarId) {
				strongSelf.eventStore.events(from: calendar) { events in
					observer.send(value: events.map {
						$0.convertToModelEntity()
					} )
					observer.sendCompleted()
				}
			} else {
				observer.send(value: [])
				observer.sendCompleted()
			}
		}
	}

	fileprivate func getCalendarById(calendarId: String) -> EKCalendar? {
		let calendar = eventStore.calendar(withIdentifier: calendarId)
		return calendar
	}
}


// TODO: move to separate files
extension EKCalendar {
	public func convertToModelEntity() -> CalendarEntity {
		let calendarEntity = CalendarEntity(calendarIdentifier: self.calendarIdentifier, title: self.title)
		return calendarEntity
	}
}

extension EKEvent {
	public func convertToModelEntity() -> EventEntity {
		let eventEntity = EventEntity.init(eventIdentifier: self.eventIdentifier
				, title: self.title
				, location: self.location
				, startDate: self.startDate
				, endDate: self.endDate)
		return eventEntity
	}
}


extension EKEventStore {
	public typealias EventsRequestCompletionHandler = ([EKEvent]) -> Void

	public func events(from calendar: EKCalendar, completion: @escaping EventsRequestCompletionHandler) {
		let predicate = self.predicateForEvents(withStart: .init(timeIntervalSinceNow: -(60*60*24*7)), end: .distantFuture, calendars: [calendar])
		let queue = DispatchQueue(label: "Events request")
		queue.async { [weak self] in
			guard let selfStrong = self else {
				return
			}
			let events = selfStrong.events(matching: predicate)
			DispatchQueue.main.async {
				completion(events)
			}
		}
	}
}
