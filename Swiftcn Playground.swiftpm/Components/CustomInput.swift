import SwiftUI

struct CustomInput: View {
    @Binding var text: String
    var label: String
    var iconName: String?
    var isDisabled: Bool = false
    var placeholder: String = ""
    var placeholderColor: Color = .gray

    var body: some View {
        HStack {
            if let iconName = iconName {
                Image(systemName: iconName)
                    .foregroundColor(.gray)
                    .padding(.trailing, 2)
            }

            TextField(label, text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(placeholderColor)
                }
                .disabled(isDisabled)
                .inputBoxStyle()
        }
    }
}

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

struct CustomInput_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var inputText: String = ""

        var body: some View {
            CustomInput(
                text: $inputText,
                label: "Email",
                iconName: "envelope",
                placeholder: "Email"
            )
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
