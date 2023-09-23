//
//  Button.swift
//  Swift Playground
//
//  Created by Carlos García Morán on 9/19/23.
//

import SwiftUI

// TODO: add confetti option onSubmit
// TODO: make fontWeight an optional parameter (default to .medium)
struct CustomButton: View {
    let action: () -> Void
    let label: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: action) {
            Text(label).fontWeight(.medium)
        }
        .customButtonStyle()
    }
}

struct CustomButtonModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(colorScheme == .dark ? Color.white : Color.black)
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .cornerRadius(8)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(CustomButtonModifier())
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {
            print("Button tapped!")
        }, label: "Button")
    }
}
