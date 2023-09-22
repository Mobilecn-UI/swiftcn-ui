import SwiftUI

// TODO: make For you underline color actual blue
// TODO: center X correctly (right between tabs)
struct XHomeView: View {
    @Environment(\.colorScheme) var colorScheme

    let xProfilePicUrl = "https://avatars.githubusercontent.com/u/53033648?v=4"

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            // User profile pic and X logo
            HStack {
                CustomAvatar(
                     imageURL: xProfilePicUrl,
                     fallbackText: "SS",
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
                    .frame(height: 0.9)
                    .padding(.horizontal, 30)
                    .background(Color(.systemGray4))
            }

            PostView(
                avatarURL: "https://avatars.githubusercontent.com/u/46545682?v=4",
                avatarFallback: "CG",
                name: "Carlos",
                handle: "cgarciamoran",
                timestamp: "3m",
                text: "Introducing Swiftcn UI. Build sleek interfaces using beautiful, intuitive components. Stay tuned 🛝",
                repliesCount: 1,
                repostsCount: 0,
                likesCount: 3
            ).padding(.horizontal)
            Divider()
                .frame(height: 0.9)
                .padding(.horizontal, 30)
                .background(Color(.systemGray4))
            
            PostView(
                avatarURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
                avatarFallback: "SS",
                name: "Suman",
                handle: "0xSuman",
                timestamp: "3m",
                text: "Really enjoyed talk from @jainarvind and @mamoonha at the @kleinerperkins founders summit",
                repliesCount: 0,
                repostsCount: 1,
                likesCount: 8
            ).padding(.horizontal)

            Divider()
                .frame(height: 0.9)
                .padding(.horizontal, 30)
                .background(Color(.systemGray4))

            Spacer()
        }
    }
}

struct XHomeView_Previews: PreviewProvider {
    static var previews: some View {
        XHomeView()
    }
}
