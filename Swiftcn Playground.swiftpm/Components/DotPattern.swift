import SwiftUI

// TODO: determine default backgroundColor based on colorScheme
struct DotPattern: View {
    var backgroundColor: Color = .black
    var dotColor: Color = .primary
    var opacity: Double = 1.0
    var spacing: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let xDots = Int(ceil(geometry.size.width / (16 + spacing)))
                let yDots = Int(ceil(geometry.size.height / (16 + spacing)))

                ForEach(0..<xDots, id: \.self) { xIndex in
                    ForEach(0..<yDots, id: \.self) { yIndex in
                        Circle()
                            .fill(dotColor)
                            .opacity(opacity)
                            .frame(width: 2, height: 2)
                            .offset(
                                x: CGFloat(xIndex) * (16 + spacing) + 1,
                                y: CGFloat(yIndex) * (16 + spacing) + 1
                            )
                    }
                }
            }
        }
        .background(backgroundColor)
        .ignoresSafeArea()
    }
}

struct DotPattern_Previews: PreviewProvider {
    static var previews: some View {
        DotPattern(
            backgroundColor: .black,
            opacity: 0.5,
            spacing: 15
        )
    }
}
