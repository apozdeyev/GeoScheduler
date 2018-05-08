//
// Created by Anatoliy Pozdeyev on 05/12/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

public protocol ICalendarEventsListModel {
	var events: Property<[IEventCellModel]> { get }

	var requestEvents: Action<(), [IEventCellModel], AnyError> { get }
}

