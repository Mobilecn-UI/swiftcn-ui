import SwiftUI

// TODO: center X correctly (right between tabs)
struct XHomeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let forYouPosts: [PostView] = [
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/46545682?v=4",
            avatarFallback: "CG",
            name: "Carlos",
            handle: "cgarciamoran",
            timestamp: "3m",
            text: "Introducing Swiftcn UI. Build sleek interfaces using beautiful, intuitive components. Stay tuned! 🛝",
            repliesCount: 1,
            repostsCount: 0,
            likesCount: 3,
            viewsCount: 128
        ),
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
            avatarFallback: "SS",
            name: "Suman",
            handle: "0xSuman",
            timestamp: "1h",
            text: "Really enjoyed talk from @jainarvind and @mamoonha at the @kleinerperkins founders summit",
            repliesCount: 0,
            repostsCount: 1,
            likesCount: 8,
            viewsCount: 700
        ),
        PostView(
            avatarURL: "https://pbs.twimg.com/profile_images/1514863683574599681/9k7PqDTA_400x400.jpg",
            avatarFallback: "ML",
            name: "Marc Lou",
            handle: "marc_louvion",
            timestamp: "Jan 7",
            text: "7 years as an entrepreneur and 1 takeaway:\n\nShip more",
            repliesCount: 145,
            repostsCount: 259,
            likesCount: 3173,
            viewsCount: 4970,
            imageURL: "https://pbs.twimg.com/media/Fl2ZEJkaAAAgP4I?format=jpg&name=medium"
        )
    ]
    let followingPosts: [PostView] = [
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
            avatarFallback: "SS",
            name: "Suman",
            handle: "0xSuman",
            timestamp: "1h",
            text: "Very cool esketit.",
            repliesCount: 4,
            repostsCount: 5,
            likesCount: 8,
            viewsCount: 256
        ),
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/46545682?v=4",
            avatarFallback: "CG",
            name: "Carlos",
            handle: "cgarciamoran",
            timestamp: "3m",
            text: "Indeed vv cool stuff. Swiftcn be popping",
            repliesCount: 1,
            repostsCount: 3,
            likesCount: 3,
            viewsCount: 7
        )
    ]

    let profilePicURL = "https://pbs.twimg.com/profile_images/1256841238298292232/ycqwaMI2_400x400.jpg"
    let profilePicFallback = "N"
    let tabs: [(String, AnyView)]
    @State private var selectedTab: String = "For you"
    
    init() {
        self.tabs = [
            ("For you", AnyView(FeedView(posts: forYouPosts))),
            ("Following", AnyView(FeedView(posts: followingPosts)))
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            // User profile pic and X logo
            HStack {
                CustomAvatar(
                     imageURL: profilePicURL,
                     fallbackText: profilePicFallback,
                     width: 40,
                     height: 40
                )

                Spacer()

                Image(colorScheme == .dark ? "xlogo-white" : "xlogo-black")
                    .resizable()
                    .frame(width: 30, height: 30)

                Spacer()
            }.padding()

            TabsView(selectedTab: $selectedTab, tabs: tabs)

            Spacer()
        }
    }
}

// TODO: animate selector on selectedTab change
// TODO: fix width for Following
struct TabsView: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var selectedTab: String
    let tabs: [(String, AnyView)]

    let underlineColor = Color(red: 28 / 255, green: 155 / 255, blue: 240 / 255)

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

struct FeedView: View {
    let posts: [PostView]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 15) {
                ForEach(posts, id: \.text) { post in
                    post
                        .padding(.horizontal)
                    Divider()
                        .background(Color(.systemGray5))
                        .frame(height: 0.7)
                }
            }
        }
    }
}

struct XHomeView_Previews: PreviewProvider {
    static var previews: some View {
        XHomeView()
    }
}
