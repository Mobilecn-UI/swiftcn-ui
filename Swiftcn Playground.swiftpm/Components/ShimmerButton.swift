import SwiftUI

struct ShimmerButton: View {
    let text: String
    let textSize: CGFloat
    let shimmerDuration: Double
    let borderRadius: CGFloat
    let backgroundColor: Color
    let textColor: Color
    
    @State private var animationProgress: CGFloat = 0.0
    
    init(text: String,
         textSize: CGFloat = 20.0,
         shimmerDuration: Double = 3.0,
         borderRadius: CGFloat = 30,
         backgroundColor: Color = .black,
         textColor: Color = .white) {
        
        self.text = text
        self.textSize = textSize
        self.shimmerDuration = shimmerDuration
        self.borderRadius = borderRadius
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: borderRadius)
                .fill(backgroundColor)
                .frame(height: 60)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10) // Adding shadow
            
            // Text
            Text(text)
                .foregroundColor(textColor)
                .font(.system(size: textSize))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5) // Adding shadow
            
            // Shimmer
            GeometryReader { geometry in
                let rect = geometry.frame(in: .local)
                Capsule()
                    .trim(from: animationProgress, to: animationProgress + 0.1)
                    .stroke(textColor, lineWidth: 4)
                    .frame(width: rect.width, height: rect.height)
                    .onAppear {
                        withAnimation(Animation.linear(duration: shimmerDuration).repeatForever(autoreverses: false)) {
                            animationProgress = 1.0
                        }
                    }
            }
        }
        .frame(width: 200, height: 60)
    }
}

struct ShimmerButton_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerButton(text: "Submit", textSize: 30, backgroundColor: .black, textColor: .white)
    }
}
