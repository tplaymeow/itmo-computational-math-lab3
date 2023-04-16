import XCTest
@testable import IntegralsCalculator

final class RectangleMethodTests: XCTestCase {
  func testRectangleMethodLeft1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Rectangle(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        position: .left,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testRectangleMethodMiddle1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Rectangle(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        position: .middle,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testRectangleMethodRight1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Rectangle(
        function: { x in
          2 * x + sin(x)
        },
        interval: .init(-6, 2),
        position: .right,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, -30.624, accuracy: tolerance)
    }
  }

  func testRectangleMethodLeft2() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Rectangle(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        position: .left,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }

  func testRectangleMethodMiddle2() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Rectangle(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        position: .middle,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }

  func testRectangleMethodRight2() {
    self.measure {
      let tolerance = 0.1
      let method = Methods.Rectangle(
        function: { x in
          pow(log(x), 5)
        },
        interval: .init(1, 200),
        position: .right,
        tolerance: tolerance
      )
      let output = method.run()
      XCTAssertEqual(output.value, 408372.2063866, accuracy: tolerance)
    }
  }
}
