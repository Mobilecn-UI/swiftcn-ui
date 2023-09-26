import SwiftUI

struct CustomBadge: View {
    var label: String
    var backgroundColor: Color?
    var foregroundColor: Color?

    var body: some View {
        Text(label)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(backgroundColor ?? .blue)
            .foregroundColor(foregroundColor ?? .white)
            .cornerRadius(8)
    }
}

struct CustomBadge_Previews: PreviewProvider {
    static var previews: some View {
        CustomBadge(label: "Badge")
    }
}
