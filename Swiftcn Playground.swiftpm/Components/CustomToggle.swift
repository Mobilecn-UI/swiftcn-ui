//
//  CustomToggle.swift
//  
//
//  Created by Carlos García Morán on 9/20/23.
//

import SwiftUI

// TODO: extract toggle color to optional parameter
struct CustomToggle: View {
    @State private var state = false
    let label: String

    var body: some View {
        Toggle(isOn: $state) {
            Text(label)
        }
        .toggleStyle(CustomToggleStyle())
        .padding()
    }
}

struct CustomToggleStyle: ToggleStyle {
    @Environment(\.colorScheme) var colorScheme

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(configuration.isOn ?
                      colorScheme == .dark ? .white : .black : Color.secondary.opacity(0.2)
                )
                .frame(width: 50, height: 30, alignment: .center)
                .overlay(
                    Circle()
                        .fill(colorScheme == .dark ? .black : .white)
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .animation(.linear(duration: 0.2), value: configuration.isOn)
        }
    }
}

struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle(label: "Toggle me")
    }
}
