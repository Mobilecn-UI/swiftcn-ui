import SwiftUI

struct CustomTextEditor<Value: InputConvertible>: View {
    @Binding var value: Value
    var iconName: String?
    var isDisabled: Bool = false
    var placeholder: String = ""
    var placeholderColor: Color = .gray
    // Internal text representation for TextField
    @State private var text: String
    
    init(value: Binding<Value>, iconName: String? = nil, isDisabled: Bool = false, placeholder: String = "", placeholderColor: Color = .gray) {
        self._value = value
        self.iconName = iconName
        self.isDisabled = isDisabled
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self._text = State(initialValue: value.wrappedValue.description)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let iconName = iconName {
                Image(systemName: iconName)
                    .foregroundColor(.gray)
                    .padding(.trailing, 2)
                    .padding(.bottom, 2)
            }
            TextEditor(text: $text)
                .onChange(of: text) { newValue in
                    if let newValue = Value(newValue) {
                        value = newValue
                    }
                }
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(placeholderColor)
                }
                .disabled(isDisabled)
                .inputBoxStyle()
        }
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var inputText: String = ""

        var body: some View {
            CustomTextEditor(
                value: $inputText,
                iconName: "envelope",
                placeholder: "Email"
            )
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
