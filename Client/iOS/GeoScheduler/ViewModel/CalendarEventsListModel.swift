//
// Created by Anatoliy Pozdeyev on 05/12/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import ReactiveSwift
import Model
import Result

public final class CalendarEventsListModel: ICalendarEventsListModel {
	fileprivate let calendarId: String
	fileprivate let calendarProxy: ICalendarProxy
	fileprivate let _events = MutableProperty<[IEventCellModel]>([])

	public init(calendarProxy: ICalendarProxy, calendarId: String) {
		self.calendarProxy = calendarProxy
		self.calendarId = calendarId

		self.requestEvents
				.apply()
				.start()
	}

	public var events: Property<[IEventCellModel]> {
		return Property(_events)
	}

	public var requestEvents: Action<(), [IEventCellModel], AnyError> {
		return Action() { _ in
			return self.calendarProxy.requestEventsOfCalendar(calendarId: self.calendarId)
					.map { [weak self] (eventEntities) in

						guard let strongSelf = self else {
							return []
						}

						strongSelf._events.value = eventEntities.map {
							EventCellModel(event: $0)
						}
						return strongSelf._events.value
					}
		}
	}
}