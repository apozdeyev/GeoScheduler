import ReactiveSwift
import Result

extension SignalProducer {
	public func omitErrors() -> ReactiveSwift.SignalProducer<Value, NoError> {
		return self.flatMapError { _ in
			SignalProducer<Value, NoError>.empty
		}
	}

	public func mapArrayValues<N>(_ transform: @escaping (Value.Element) -> N) -> ReactiveSwift.SignalProducer<[N], Error> where Value: Collection {
		return self.map {
				$0.map {
					transform($0)
				}
		}
	}
}
