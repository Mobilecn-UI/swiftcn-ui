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
                            Text("Badge")
                                .font(.title2).fontWeight(.medium)
                            
                            HStack {
                                CustomBadge(label: "Badge")
                                CustomBadge(label: "Badge", backgroundColor: .green)
                                CustomBadge(label: "Badge", backgroundColor: .yellow, foregroundColor: .black)
                                CustomBadge(label: "Badge", backgroundColor: .red)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Button")
                                .font(.title2).fontWeight(.medium)
                            
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
                            Text("Input").font(.title2).fontWeight(.medium)
                            
                            CustomInput(
                                text: $inputText, iconName: "envelope", placeholder: "Email"
                            )
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Slider").font(.title2).fontWeight(.medium)

                            CustomSlider()
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
                            Text("Toggle")
                                .font(.title2).fontWeight(.medium)

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
