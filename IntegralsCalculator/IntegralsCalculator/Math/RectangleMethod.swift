extension Methods {
  struct Rectangle {
    let function: Function
    let interval: Interval
    let position: RectanglePosition
    let tolerance: Double

    func run() -> Output {
      Methods.common(tolerance: self.tolerance) { partsCount in
        let delta = self.interval.length / Double(partsCount)
        var x = self.interval.from + self.position.rawValue * delta
        var result = 0.0
        for _ in 0..<partsCount {
          result += self.function(x)
          x += delta
        }
        return result * delta
      }
    }
  }
}
