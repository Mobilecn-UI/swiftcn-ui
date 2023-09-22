import SwiftUI

// TODO: add verified badge
// TODO: use same icons for replies, retweet, and like.
// TODO: add stats button and share button
// TODO: if handle is too long, use handle.prefix(x) + "..."
// TODO: color in blue tags inside `text`
// TODO: add support for image
struct PostView: View {
    let avatarURL: String
    let avatarFallback: String
    let name: String
    let handle: String
    let timestamp: String
    let text: String
    let repliesCount: Int
    let repostsCount: Int
    let likesCount: Int

    var body: some View {
        HStack(alignment: .top, spacing: 11) {
            CustomAvatar(
                 imageURL: avatarURL,
                 fallbackText: avatarFallback,
                 width: 44,
                 height: 44
            )

            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(name)
                        .fontWeight(.bold)
                    Text("@" + handle + " • " + timestamp)
                        .foregroundColor(Color(.systemGray))
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color(.systemGray2))
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(text)
                        .font(.system(size: 18))

                    HStack() {
                        HStack (spacing: 5) {
                            Image(systemName: "bubble.left")
                                .imageScale(.medium)
                                .foregroundColor(Color(white: 0.7))
                            Text(String(repliesCount))
                        }

                        HStack (spacing: 5) {
                            Image(systemName: "repeat")
                                .imageScale(.medium)
                                .foregroundColor(Color(.systemGray))
                            Text(String(repostsCount))
                        }.frame(maxWidth: .infinity)

                        HStack (spacing: 5) {
                            Image(systemName: "heart")
                                .imageScale(.medium)
                                .font(.system(size: 16))
                                .foregroundColor(Color(.systemGray))
                            Text(String(likesCount))
                        }
                    }
                    .font(.system(size: 17))
                    .padding(.trailing)
                }
            }
        }
    }
}
