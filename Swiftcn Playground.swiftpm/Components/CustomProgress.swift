import SwiftUI

struct CustomProgress: View {
    var value: Double
    var tint: Color?
    
    var body: some View {
        VStack {
            ProgressView(value: value)
                .progressViewStyle(LinearProgressViewStyle(tint: tint ?? .primary))
        }
    }
}

struct CustomProgress_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgress(value: 0.5)
    }
}
