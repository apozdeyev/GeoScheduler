//
//  ViewModelTests.swift
//  ViewModelTests
//
//  Created by Anatoliy Pozdeyev on 05/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Model
@testable import ViewModel

class CalendarCellModelSpec: QuickSpec {
	override func spec() {
		describe("CalendarCellModel") {
			it("Converting from CalendarEntity.") {
				let calendars = [ CalendarEntity(calendarIdentifier: "1", title: "calendar_1")
								  , CalendarEntity(calendarIdentifier: "2", title: "calendar_2")
								  , CalendarEntity(calendarIdentifier: "3", title: "calendar_3") ]
				let calendarProxy = CalendarProxyStub(isAccesToCalendarGranted: true, isAccesToCalendarAllowed: true, calendars: calendars)
				let calendarsListModel = CalendarsListModel(calendarProxy: calendarProxy)
				
				var calendarCellModels: [ICalendarCellModel]? = nil
				calendarsListModel.requestCalendars.apply()
						.on(value: { calendarCellModels = $0 } )
						.start()

				expect(calendarCellModels).toEventuallyNot(beNil(), timeout: 1)
				expect(calendarCellModels!.count).toEventually(equal(calendars.count))
				for i in (0..<calendarCellModels!.count) {
					let calendar = calendars[i]
					let calendarCellModel = calendarCellModels![i]
					expect(calendar.calendarIdentifier).toEventually(equal(calendarCellModel.id))
					expect(calendar.title).toEventually(equal(calendarCellModel.title))
				}
			}
		}
	}
}
