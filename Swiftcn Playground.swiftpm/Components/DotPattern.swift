import SwiftUI

struct DotPattern: View {
    var dotColor: Color = Color.blue
    var spacing: CGFloat = 0
    var brightness: Double = 1.0 // Range from 0.0 to 1.0
    var backgroundColor: Color = Color.black // Added this line for background color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let xDots = Int(ceil(geometry.size.width / (16 + spacing)))
                let yDots = Int(ceil(geometry.size.height / (16 + spacing)))
                
                ForEach(0..<xDots, id: \.self) { xIndex in
                    ForEach(0..<yDots, id: \.self) { yIndex in
                        Circle()
                            .fill(dotColor)
                            .opacity(brightness)
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
        DotPattern(dotColor: Color.white, spacing: 15, brightness: 0.5, backgroundColor: .black)
    }
}
