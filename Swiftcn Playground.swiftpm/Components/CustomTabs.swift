//
//  CustomTabs.swift
//
//
//  Created by Carlos García Morán on 9/23/23.
//

import SwiftUI

// TODO: default underlineColor based on colorScheme
// TODO: add variants: "default and minimal"
// TODO: set underline width according to tab key length
// TODO: animate selector on selectedTab change
struct CustomTabs: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var selectedTab: String
    let tabs: [(String, AnyView)]
    let underlineColor: Color

    init(
        selectedTab: Binding<String>,
        tabs: [(String, AnyView)],
        underlineColor: Color = .white // NOTE: this is bad in light mode
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.underlineColor = underlineColor
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                ForEach(tabs, id: \.0) { key, _ in
                    VStack(spacing: 10) {
                        Text(key)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(selectedTab == key ?
                                             colorScheme == .dark ? .white : .black : .gray)
                            .onTapGesture {
                                selectedTab = key
                            }

                        if selectedTab == key {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 59, height: 4)
                                .foregroundColor(underlineColor)
                        }
                    }.frame(maxWidth: .infinity)
                }
            }.padding(.horizontal, 9)

            Divider()
                .background(Color(.systemGray5))
                .frame(height: 0.7)
                .padding(.bottom, 10)

            if let selectedView = tabs.first(where: { $0.0 == selectedTab })?.1 {
                selectedView
            }
        }
    }
}

struct CustomTabs_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selectedTab: String = "Tab A"

        let tabs: [(String, AnyView)] = [
            ("Tab A", AnyView(Text("Tab A content"))),
            ("Tab B", AnyView(Text("Tab B content")))
        ]

        var body: some View {
            CustomTabs(
                selectedTab: $selectedTab,
                tabs: tabs
            )
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
