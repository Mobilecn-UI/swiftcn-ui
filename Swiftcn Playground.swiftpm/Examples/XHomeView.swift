import SwiftUI

// TODO: make For you underline color actual blue
// TODO: center X correctly (right between tabs)
struct XHomeView: View {
    @Environment(\.colorScheme) var colorScheme

    let posts: [PostView] = [
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/46545682?v=4",
            avatarFallback: "CG",
            name: "Carlos",
            handle: "cgarciamoran",
            timestamp: "3m",
            text: "Introducing Swiftcn UI. Build sleek interfaces using beautiful, intuitive components. Stay tuned 🛝",
            repliesCount: 1,
            repostsCount: 0,
            likesCount: 3,
            viewsCount: 700
        ),
        PostView(
            avatarURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
            avatarFallback: "SS",
            name: "Suman",
            handle: "0xSuman",
            timestamp: "3m",
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
    let profilePicURL = "https://avatars.githubusercontent.com/u/53033648?v=4"
    let profilePicFallback = "SS"


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
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)

                Spacer()
            }.padding()

            // For you and Following tabs
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    VStack(spacing: 10) {
                        Text("For you")
                            .font(.system(size: 18, weight: .bold, design: .default))

                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 66, height: 4)
                            .foregroundColor(Color.blue)
                    }.padding(0)

                    Spacer()

                    Text("Following")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(Color.gray)
                }.padding(.horizontal, 70)

                Divider()
                    .background(Color(.systemGray5))
                    .frame(height: 0.9)
            }

            // Posts
            ScrollView {
                VStack (spacing: 15) {
                    ForEach(posts, id: \.avatarURL) { post in
                        post
                            .padding(.horizontal)
                        Divider()
                            .background(Color(.systemGray5))
                            .frame(height: 0.7)
                    }
                }
            }

            Spacer()
        }
    }
}

struct XHomeView_Previews: PreviewProvider {
    static var previews: some View {
        XHomeView()
    }
}
