import SwiftUI

struct CustomAvatar: View {
    let imageURL: String
    let fallbackText: String
    let width: CGFloat
    let height: CGFloat
    let fallbackColor: Color

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                fallbackView
            @unknown default:
                fallbackView
            }
        }
        .clipShape(Circle())
        .frame(width: width, height: height)
    }
    
    var fallbackView: some View {
        Circle()
            .fill(fallbackColor)
            .overlay(
                Text(fallbackText)
                    .font(.system(size: min(width, height) * 0.3))
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(fallbackColor)) // Adding a background to ensure text stays within the circle
                    .minimumScaleFactor(0.5) // Allows the text to scale down if needed
            )
    }
}
