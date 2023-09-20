//
//  CustomInput.swift
//  Swift Playground
//
//  Created by Carlos García Morán on 9/19/23.
//

import SwiftUI

// TODO: pass SF Symbols icon as optional param
struct CustomInput: View {
    @Binding var text: String
    var placeholder: String

    // TODO: make placeholder light/dark grey
    // See https://stackoverflow.com/a/57715771
    var body: some View {
        TextField("", text: $text)
            .inputBoxStyle()
    }
}

struct InputBoxModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            .background(colorScheme == .dark ? Color.white : Color.black)
            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

extension View {
    func inputBoxStyle() -> some View {
        self.modifier(InputBoxModifier())
    }
}
