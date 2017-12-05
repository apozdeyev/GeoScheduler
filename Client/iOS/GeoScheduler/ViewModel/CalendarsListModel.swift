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

public final class CalendarsListModel: ICalendarsListModel {
	fileprivate let calendarProxy: ICalendarProxy
	fileprivate let _calendars = MutableProperty<[ICalendarCellModel]>([])
	fileprivate let _isAccesToCalendarGranted = MutableProperty<Bool>(false)

	public init(calendarProxy: ICalendarProxy) {
		self.calendarProxy = calendarProxy
		_isAccesToCalendarGranted.value = self.calendarProxy.isAccesToCalendarGranted()
	}

	public var isAccesToCalendarGranted: Property<Bool> {
		return Property(_isAccesToCalendarGranted)
	}
	public var calendars: Property<[ICalendarCellModel]> {
		return Property(_calendars)
	}

	public var requestAccesToCalendar: Action<(), Bool, AnyError> {
		return Action(enabledIf: isAccesToCalendarGranted.map(!)) { _ in
			return self.calendarProxy.requestAccesToCalendar()
					.on(value: {
						self._isAccesToCalendarGranted.value = $0
					})
		}
	}

	public var requestCalendars: Action<(), [ICalendarCellModel], AnyError> {
		return Action(enabledIf: isAccesToCalendarGranted) { _ in
			return self.calendarProxy.requestCalendars()
					.map { [weak self] (calendarEntities) in

						guard let strongSelf = self else {
							return []
						}

						strongSelf._calendars.value = calendarEntities.map {
							CalendarCellModel(calendar: $0)
						}
						return strongSelf._calendars.value
					}
		}
	}
}

