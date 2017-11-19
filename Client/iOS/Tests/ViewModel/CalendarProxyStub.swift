//
//  CalendarProxyStub.swift
//  ViewModelTests
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation
import Model
import ReactiveSwift
import Result

public class CalendarProxyStub: ICalendarProxy {
	fileprivate var _isAccesToCalendarGranted: Bool = false
	fileprivate var _calendars: [CalendarEntity] = []
	fileprivate let isAccesToCalendarAllowed: Bool;
	
	public init(isAccesToCalendarGranted: Bool, isAccesToCalendarAllowed: Bool, calendars: [CalendarEntity]) {
		self._isAccesToCalendarGranted = isAccesToCalendarGranted
		self.isAccesToCalendarAllowed = isAccesToCalendarAllowed
		self._calendars = calendars
	}
	
	public func isAccesToCalendarGranted() -> Bool {
		return _isAccesToCalendarGranted
		
	}
	
	public func requestAccesToCalendar() -> SignalProducer<Bool, AnyError> {
		return SignalProducer { [weak self] (observer, disposable) in
			guard let strongSelf = self else {
				return
			}
			
			strongSelf._isAccesToCalendarGranted = strongSelf.isAccesToCalendarAllowed
			observer.send(value: strongSelf.isAccesToCalendarAllowed)
			observer.sendCompleted()
		}
	}
	
	
	public func requestCalendars() -> SignalProducer<[CalendarEntity], AnyError> {
		return SignalProducer { [weak self] (observer, disposable) in
			guard let strongSelf = self else {
				return
			}
			
			observer.send(value: strongSelf._calendars)
			observer.sendCompleted()
		}
	}
}
