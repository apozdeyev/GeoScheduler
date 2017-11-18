//
//  ModelTests.swift
//  ModelTests
//
//  Created by Anatoliy Pozdeyev on 05/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import Model

class CalendarProxySpec: QuickSpec {
	override func spec() {
		describe("CalendarProxy") {
			it("Just request access.") {
				let calendarProxy = CalendarProxy()
                if (!calendarProxy.isAccesToCalendarGranted()) {
                    calendarProxy.requestAccesToCalendar().start()
                }
			}

            it("If access is granted, then calendars count must be > 0, otherwise 0.") {
                var calendars: [CalendarEntity]? = nil
                let calendarProxy = CalendarProxy()
                calendarProxy.requestCalendars()
                        .on(value: { calendars = $0 } )
                        .start()

				expect(calendars).toEventuallyNot(beNil(), timeout: 1)
                if (calendarProxy.isAccesToCalendarGranted()) {
                    expect(calendars!.count) > 0
                } else {
                    expect(calendars!.count) == 0
                }
            }
		}
	}
}
