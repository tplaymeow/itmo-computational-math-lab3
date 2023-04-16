import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      ChartView(data: [self.viewModel.chartData])

      Form {
        Picker(
          "Method",
          selection: self.$viewModel.methodVariant
        ) {
          ForEach(self.viewModel.methodVariants, id: \.self) { variant in
            Text(variant.displayString)
          }
        }

        Picker(
          "Function",
          selection: self.$viewModel.functionVariant
        ) {
          ForEach(self.viewModel.functionVariants, id: \.self) { variant in
            Text(variant.displayString)
          }
        }

        TextField(
          "Interval from",
          value: self.$viewModel.intervalFrom,
          formatter: self.numberFormatter
        )

        TextField(
          "Interval to",
          value: self.$viewModel.intervalTo,
          formatter: self.numberFormatter
        )

        TextField(
          "Tolerance",
          value: self.$viewModel.tolerance,
          formatter: self.numberFormatter
        )

        Button("Calculate") {
          self.viewModel.run()
        }

        if let output = self.viewModel.output {
          Text("Value: \(output.value)")
          Text("Parts Count: \(output.partsCount)")
          Text("Error: \(output.error)")
        }
      }
    }
    .padding()
  }

  @ObservedObject
  private var viewModel: ViewModel = .init()

  private let numberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 4
    return formatter
  }()
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
