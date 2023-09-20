import SwiftUI

struct CustomSlider: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var value: Double = 50
    private var range: ClosedRange<Double> = 0...100

    var body: some View {
        VStack {
            Slider(value: $value, in: range) {
                Text("Slider")
            }
            .accentColor(colorScheme == .dark ? .white : .black)
            .padding(10)
        }
    }
}

struct SliderComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider()
    }
}
