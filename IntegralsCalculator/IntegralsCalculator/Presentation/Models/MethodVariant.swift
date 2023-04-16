enum MethodVariant: Equatable, CaseIterable {
  case rectangleLeft
  case rectangleMiddle
  case rectangleRight
  case trapezoid
  case simpsons
}

extension MethodVariant {
  var displayString: String {
    switch self {
    case .rectangleLeft:
      return "Left Rectangles"
    case .rectangleMiddle:
      return "Middle Rectangles"
    case .rectangleRight:
      return "Right Rectangles"
    case .trapezoid:
      return "Trapezoid"
    case .simpsons:
      return "Simpsons"
    }
  }
}
