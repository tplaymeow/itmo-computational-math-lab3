enum Methods {
  typealias Function = (Double) -> Double

  struct Interval: Equatable {
    let from: Double
    let to: Double

    init(_ a: Double, _ b: Double) {
      self.from = min(a, b)
      self.to = max(a, b)
    }
  }

  struct RectanglePosition: Equatable, RawRepresentable {
    let rawValue: Double
  }

  struct Output {
    let value: Double
    let partsCount: Int
    let error: Double
  }

  static func common(
    tolerance: Double,
    runWithPartsCount: (Int) -> Double
  ) -> Output {
    var partsCount = 4
    var result = Double.infinity
    while true {
      let newResult = runWithPartsCount(partsCount)
      let error = abs(newResult - result)
      guard error < tolerance else {
        partsCount *= 2
        result = newResult
        continue
      }
      return Output(
        value: newResult,
        partsCount: partsCount,
        error: error
      )
    }
  }
}

extension Methods.Interval {
  var length: Double {
    self.to - self.from
  }

  func contains(_ point: Double) -> Bool {
    self.from <= point && point <= self.to
  }
}

extension Methods.RectanglePosition {
  static var left: Self { .init(rawValue: 0.0) }
  static var middle: Self { .init(rawValue: 0.5) }
  static var right: Self { .init(rawValue: 1.0) }
}
