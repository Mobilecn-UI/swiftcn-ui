import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double

    var accentColor: Color = .primary
    var range: ClosedRange<Double> = 0...100
    var showLabels: Bool = false

    var body: some View {
        Slider(
            value: $value,
            in: range
        ) {
            if showLabels {
                Text("Slider")
            }
        } minimumValueLabel: {
            if showLabels {
                Text("\(Int(range.lowerBound))")
            }
        } maximumValueLabel: {
            if showLabels {
                Text("\(Int(range.upperBound))")
            }
        }.accentColor(accentColor)
    }
}

struct SliderComponent_Previews: PreviewProvider {
    @State static var value: Double = 50

    static var previews: some View {
        CustomSlider(value: $value)
    }
}
