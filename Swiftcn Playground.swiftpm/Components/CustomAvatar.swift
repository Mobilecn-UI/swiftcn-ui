import SwiftUI

struct CustomAvatar: View {
    let imageURL: String
    let fallbackText: String
    let fallbackBgColor: Color
    let fallbackFgColor: Color
    let width: CGFloat
    let height: CGFloat
    
    init(
        imageURL: String,
        fallbackText: String,
        fallbackBgColor: Color = .black,
        fallbackFgColor: Color = .white,
        width: CGFloat,
        height: CGFloat
    ) {
        self.imageURL = imageURL
        self.fallbackText = fallbackText
        self.fallbackBgColor = fallbackBgColor
        self.fallbackFgColor = fallbackFgColor
        self.width = width
        self.height = height
    }

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                fallbackView
            case .empty:
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
            .fill(fallbackBgColor)
            .overlay(
                Text(fallbackText)
                    .font(.system(size: min(width, height) * 0.3))
                    .foregroundColor(fallbackFgColor)
                    .minimumScaleFactor(0.5) // Allows the text to scale down if needed
                    .padding()
            )
    }
}

struct CustomAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CustomAvatar(
            imageURL: "https://example.com/your-avatar.png",
            fallbackText: "AB",
            width: 100,
            height: 100
        )
    }
}
