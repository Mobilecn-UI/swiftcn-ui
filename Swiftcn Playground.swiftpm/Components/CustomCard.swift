import SwiftUI

struct CustomCard: View {
    var title: String?
    var description: String?
    var content: String?
    var footer: String?
    var backgroundColor: Color?
    var titleColor: Color?
    var descriptionColor: Color?
    var contentColor: Color?
    var footerColor: Color?

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                VStack {
                    if let title = title {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(titleColor ?? .primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    if let description = description {
                        Text(description)
                            .font(.subheadline)
                            .foregroundStyle(descriptionColor ?? .gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                if let content = content {
                    Text(content)
                        .font(.callout)
                        .foregroundStyle(contentColor ?? .primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if let footer = footer {
                    Text(footer)
                        .font(.caption)
                        .foregroundStyle(footerColor ?? .gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
                .padding(.horizontal, 24)
                .padding(.vertical, 22)
        }
            .background(backgroundColor ?? .clear)
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray))
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 2)
    }
}

struct CustomCard_Previews: PreviewProvider {
    static var previews: some View {
        CustomCard(
            title: "Card title",
            description: "Card description",
            content: "Card content",
            footer: "Card footer"
        )
    }
}
