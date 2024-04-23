import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var inputText: String = ""
    @State private var inputTextEditor: String = ""
    @State private var selectedTab: String = "Tab A"
    @State private var sliderValue: Double = 50

    let tabs: [(String, AnyView)] = [
        ("Tab A", AnyView(Text("Tab A content"))),
        ("Tab B", AnyView(Text("Tab B content")))
    ]

    var body: some View {
        ZStack{
            DotPattern(
                backgroundColor: colorScheme == .dark ? .black : .white,
                opacity: 0.2
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text("swiftcn-ui").font(.title).fontWeight(.medium).underline()

                    VStack(alignment: .leading, spacing: 30) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Avatar").font(.title2).fontWeight(.medium)
                            HStack {
                                Spacer()
                                CustomAvatar(
                                    imageURL: "https://pbs.twimg.com/profile_images/1706762093876453376/_d_KcNjw_400x400.jpg",
                                    fallbackText: "CGM",
                                    width: 70,
                                    height: 70
                                )
                                CustomAvatar(
                                    imageURL: "https://pbs.twimg.com/profile_images/1603610343905058816/PsPEWMOJ_400x400.jpg",
                                    fallbackText: "SS",
                                    width: 70,
                                    height: 70
                                )
                                Spacer()
                            }
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Badge").font(.title2).fontWeight(.medium)
                            HStack {
                                CustomBadge(label: "Badge")
                                CustomBadge(label: "Badge", backgroundColor: .gray)
                                CustomBadge(label: "Badge", backgroundColor: .red)
                                CustomBadge(label: "Badge", backgroundColor: .green)
                            }
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Button").font(.title2).fontWeight(.medium)
                            HStack {
                                CustomButton(
                                    action: { print("Button tapped!") },
                                    label: "Button"
                                )
                                CustomButton(
                                    action: { print("Button tapped!") },
                                    label: "Button",
                                    backgroundColor: .gray
                                )
                                CustomButton(
                                    action: { print("Button tapped!") },
                                    label: "Button",
                                    backgroundColor: .red
                                )
                            }
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Card").font(.title2).fontWeight(.medium)
                            CustomCard(
                                title: "Accelerate UI",
                                description: "Enter a new development experience",
                                content: "Sleek, easy to use components to build your next iOS app faster. No install, no bs.",
                                footer: "Inspired by shadcn/ui"
                            )
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Input").font(.title2).fontWeight(.medium)
                            CustomInput(
                                value: $inputText, label: "Email", iconName: "envelope"
                            )
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Text Editor").font(.title2).fontWeight(.medium)
                            CustomTextEditor(
                                value: $inputTextEditor, iconName: "square.and.pencil"
                            ).frame(minHeight: 150)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Progress").font(.title2).fontWeight(.medium)
                            CustomProgress(value: 0.75, tint: .green)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Slider").font(.title2).fontWeight(.medium)
                            CustomSlider(value: $sliderValue, accentColor: .yellow, showLabels: true)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Tabs").font(.title2).fontWeight(.medium)
                            CustomTabs(
                                selectedTab: $selectedTab,
                                tabs: tabs,
                                underlineColor: colorScheme == .dark ? .white : .black
                            )
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Toggle").font(.title2).fontWeight(.medium)
                            CustomToggle(label: "Toggle me")
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
