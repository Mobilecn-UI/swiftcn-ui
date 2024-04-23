import SwiftUI

struct InputBoxModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(colorScheme == .dark ? .black : .white)
            .cornerRadius(8)
            .foregroundColor(.primary)
            .padding(
                EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1)
            )
    }
}
