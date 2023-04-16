import XCTest
@testable import IntegralsCalculator

final class TrapezoidMethodTests: XCTestCase {
  func testTrapezoidMethodLeft1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Trapezoid(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testTrapezoidMethodMiddle1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Trapezoid(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testTrapezoidMethodRight1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Trapezoid(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testTrapezoidMethodLeft2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Trapezoid(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }

  func testTrapezoidMethodMiddle2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Trapezoid(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }

  func testTrapezoidMethodRight2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Trapezoid(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }
}
