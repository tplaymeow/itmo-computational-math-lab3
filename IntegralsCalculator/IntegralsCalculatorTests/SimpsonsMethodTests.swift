import XCTest
@testable import IntegralsCalculator

final class SimpsonsMethodTests: XCTestCase {
  func testSimpsonsMethodLeft1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Simpsons(
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

  func testSimpsonsMethodMiddle1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Simpsons(
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

  func testSimpsonsMethodRight1() {
    self.measure {
      let tolerance = 0.001
      let method = Methods.Simpsons(
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

  func testSimpsonsMethodLeft2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Simpsons(
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

  func testSimpsonsMethodMiddle2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Simpsons(
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

  func testSimpsonsMethodRight2() {
    self.measure {
      let tolerance = 0.0001
      let method = Methods.Simpsons(
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

