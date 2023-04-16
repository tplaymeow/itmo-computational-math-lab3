extension Methods {
  struct Trapezoid {
    let function: Function
    let interval: Interval
    let tolerance: Double

    func run() -> Output {
      Methods.common(tolerance: self.tolerance) { partsCount in
        let delta = self.interval.length / Double(partsCount)
        var x = self.interval.from
        var result = (self.function(self.interval.from) + self.function(self.interval.to)) / 2.0
        for _ in 1..<partsCount {
          x += delta
          result += self.function(x)
        }
        return result * delta
      }
    }
  }
}
