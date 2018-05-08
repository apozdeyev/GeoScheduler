//
// Created by Anatoliy Pozdeyev on 05/12/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import Model

public final class EventCellModel: NSObject, IEventCellModel {
	public let id: String
	public let title: String
	public let isLocationSet: Bool
	public let dateString: String

	internal init(event: EventEntity) {
		id = event.eventIdentifier
		title = event.title
		isLocationSet = (event.location != nil)
		dateString = EventCellModel.formatDate(event.startDate, event.endDate)

		super.init()
	}

	static private func formatDate(_ startDate: Date?, _ endDate: Date?) -> String {
		var dateString: String
		if let startDate = startDate, let endDate = endDate {
			dateString = "\(startDate) -> \(endDate)"
		} else if let startDate = startDate {
			dateString = startDate.description
		} else if let endDate = endDate {
			dateString = endDate.description
		} else {
			dateString = ""
		}

		return dateString
	}
}
