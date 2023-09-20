//
//  CustomInput.swift
//  Swift Playground
//
//  Created by Carlos García Morán on 9/19/23.
//

import SwiftUI

// FEAT: pass placeholder color as optional property
// TODO: add disabled option
struct CustomInput: View {
    @Binding var text: String
    var iconName: String?
    var placeholder: String?

    var body: some View {
        HStack {
            if let iconName = iconName {
                Image(systemName: iconName)
                    .foregroundColor(.gray)
                    .padding(.trailing, 2)
            }

            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder ?? "").foregroundColor(.gray)
                }
                .inputBoxStyle()
        }
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
                RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
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
