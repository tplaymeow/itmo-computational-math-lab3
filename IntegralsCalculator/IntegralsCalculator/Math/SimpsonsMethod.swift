extension Methods {
  struct Simpsons {
    let function: Function
    let interval: Interval
    let tolerance: Double

    func run() -> Output {
      Methods.common(tolerance: self.tolerance) { partsCount in
        let delta = self.interval.length / Double(partsCount)
        var x = self.interval.from
        var result = self.function(self.interval.from) + self.function(self.interval.to)
        for i in 1..<partsCount {
          x += delta
          result += i.isMultiple(of: 2)
            ? 2.0 * self.function(x)
            : 4.0 * self.function(x)
        }
        return result * delta / 3.0
      }
    }
  }
}
