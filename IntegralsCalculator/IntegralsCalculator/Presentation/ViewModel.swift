import Foundation
import Combine

final class ViewModel: ObservableObject {
  var chartData: Points {
    let intervalSize = self.intervalTo - self.intervalFrom
    guard intervalSize > 0 else { return [] }

    return linspace(
      from: self.intervalFrom - 0.1 * intervalSize,
      through: self.intervalTo + 0.1 * intervalSize,
      in: 100
    ).map { x in
      Point(x: x, y: self.functionVariant.function(x))
    }
  }

  @Published
  private(set) var functionVariants: [FunctionVariant] = FunctionVariant.allCases
  @Published
  var functionVariant: FunctionVariant = .var1

  @Published
  private(set) var methodVariants: [MethodVariant] = MethodVariant.allCases
  @Published
  var methodVariant: MethodVariant = .rectangleLeft

  @Published
  var intervalFrom: Double = 0.0
  @Published
  var intervalTo: Double = 10.0

  @Published
  var tolerance: Double = 0.1

  @Published
  private(set) var output: Methods.Output?

  func run() {
    self.output = nil

    let interval = Methods.Interval(self.intervalFrom, self.intervalTo)

    switch methodVariant {
    case .rectangleLeft:
      self.output = Methods.Rectangle(
        function: functionVariant.function,
        interval: interval,
        position: .left,
        tolerance: self.tolerance
      ).run()

    case .rectangleMiddle:
      self.output = Methods.Rectangle(
        function: functionVariant.function,
        interval: interval,
        position: .middle,
        tolerance: self.tolerance
      ).run()

    case .rectangleRight:
      self.output = Methods.Rectangle(
        function: functionVariant.function,
        interval: interval,
        position: .right,
        tolerance: self.tolerance
      ).run()

    case .trapezoid:
      self.output = Methods.Trapezoid(
        function: functionVariant.function,
        interval: interval,
        tolerance: self.tolerance
      ).run()

    case .simpsons:
      self.output = Methods.Simpsons(
        function: functionVariant.function,
        interval: interval,
        tolerance: self.tolerance
      ).run()
    }
  }
}
