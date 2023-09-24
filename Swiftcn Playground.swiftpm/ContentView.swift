import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var inputText: String = ""
    @State private var selectedTab: String = "Tab A"

    let tabs: [(String, AnyView)] = [
        ("Tab A", AnyView(Text("Tab A content"))),
        ("Tab B", AnyView(Text("Tab B content")))
    ]

    var body: some View {
        ZStack{
            DotPattern(
                dotColor: colorScheme == .dark ? .white : .black,
                spacing: 5,
                brightness: 0.2,
                backgroundColor: colorScheme == .dark ? .black : .white
            )

            VStack(spacing: 40) {
                CustomAvatar(
                    imageURL: "https://pbs.twimg.com/profile_images/1256841238298292232/ycqwaMI2_400x400.jpg",
                    fallbackText: "AB",
                    width: 80,
                    height: 80
                )
                
                CustomTabs(
                    selectedTab: $selectedTab,
                    tabs: tabs,
                    underlineColor: colorScheme == .dark ? .white : .black
                )
                
                HStack {
                    CustomInput(
                        text: $inputText, iconName: "envelope", placeholder: "Email"
                    )
                    CustomButton(action: {
                        print("Button tapped!")
                    }, label: "Button")
                }

                CustomToggle(label: "Toggle me")

                CustomSlider()
                
                HStack {
                    CustomBadge(label: "Badge")
                    CustomBadge(label: "Badge", backgroundColor: .green)
                    CustomBadge(label: "Badge", backgroundColor: .yellow, foregroundColor: .black)
                    CustomBadge(label: "Badge", backgroundColor: .red)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
