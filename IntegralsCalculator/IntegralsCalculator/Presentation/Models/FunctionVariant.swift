import Foundation

enum FunctionVariant: Equatable, CaseIterable {
  case var1
  case var2
  case var3
  case var4
}

extension FunctionVariant {
  var displayString: String {
    switch self {
    case .var1:
      return "-x^3 - x^2 - 2x + 1"
    case .var2:
      return "x + sin(x) + 1"
    case .var3:
      return "x^2"
    case .var4:
      return "sin(2x^2 + x)"
    }
  }
}

extension FunctionVariant {
  var function: Methods.Function {
    switch self {
    case .var1:
      return { x in
        -pow(x, 3) - pow(x, 2) - 2 * x + 1
      }
    case .var2:
      return { x in
        x + sin(x) + 1
      }
    case .var3:
      return { x in
        pow(x, 2)
      }
    case .var4:
      return { x in
        sin(2 * pow(x, 2) + x)
      }
    }
  }
}
