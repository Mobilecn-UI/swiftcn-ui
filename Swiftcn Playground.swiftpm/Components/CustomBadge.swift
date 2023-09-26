import SwiftUI

struct CustomBadge: View {
    @Environment(\.colorScheme) var colorScheme
    
    var label: String
    var backgroundColor: Color?
    var foregroundColor: Color?

    var body: some View {
        Text(label)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(backgroundColor ?? .primary)
            .foregroundColor(foregroundColor ?? (colorScheme == .dark ? .black : .white))
            .cornerRadius(30)
    }
}

struct CustomBadge_Previews: PreviewProvider {
    static var previews: some View {
        CustomBadge(label: "Badge")
    }
}
