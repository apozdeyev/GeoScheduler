//
// Created by Anatoliy Pozdeyev on 05/12/2017.
// Copyright (c) 2017 VitaSw. All rights reserved.
//

import ReactiveSwift
import Result

extension Property {
	public func mapArrayValues<N>(_ transform: @escaping (Value.Element) -> N) -> ReactiveSwift.Property<[N]> where Value: Collection {
		return self.map {
			$0.map {
				transform($0)
			}
		}
	}
}