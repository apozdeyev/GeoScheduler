//
// Created by Anatoliy Pozdeyev on 05/12/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import Foundation

public protocol IEventCellModel {
	var id: String { get }
	var title: String { get }
	var isLocationSet: Bool { get }
	var dateString: String { get }
}