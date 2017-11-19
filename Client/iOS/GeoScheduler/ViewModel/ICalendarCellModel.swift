//
//  ICalendarCellModel.swift
//  ViewModel
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import Foundation

public protocol ICalendarCellModel {
	var id: String { get }
	var title: String { get }
}
