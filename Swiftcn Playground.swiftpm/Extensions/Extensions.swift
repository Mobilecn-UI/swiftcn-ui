import SwiftUI

protocol InputConvertible: CustomStringConvertible {
    init?(_ description: String)
}

extension String: InputConvertible {}
extension Int: InputConvertible {}
extension Double: InputConvertible {}

extension View {
    func inputBoxStyle() -> some View {
        self.modifier(InputBoxModifier())
    }

    // Credits to https://stackoverflow.com/a/57715771
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
