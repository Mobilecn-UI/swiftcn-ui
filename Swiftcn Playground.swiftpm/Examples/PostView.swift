import SwiftUI

// TODO: color in blue tags inside `text`
// TODO: use X icons (replies, repost, views, share)
// TODO: add verified badge
// TODO: if handle is too long, use handle.prefix(x) + "..."
// TODO: abbreviate thousand/million counts (708K, 54.2M)
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
    let viewsCount: Int
    let imageURL: String?
    
    init(
        avatarURL: String,
        avatarFallback: String,
        name: String,
        handle: String,
        timestamp: String,
        text: String,
        repliesCount: Int,
        repostsCount: Int,
        likesCount: Int,
        viewsCount: Int,
        imageURL: String? = nil
    ) {
        self.avatarURL = avatarURL
        self.avatarFallback = avatarFallback
        self.name = name
        self.handle = handle
        self.timestamp = timestamp
        self.text = text
        self.repliesCount = repliesCount
        self.repostsCount = repostsCount
        self.likesCount = likesCount
        self.viewsCount = viewsCount
        self.imageURL = imageURL
    }

    var body: some View {
        HStack(alignment: .top, spacing: 11) {
            CustomAvatar(
                 imageURL: avatarURL,
                 fallbackText: avatarFallback,
                 width: 44,
                 height: 44
            )

            VStack(alignment: .leading, spacing: 5) {
                // Header
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
                    Text(name)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                    Text("@" + handle + " • " + timestamp)
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 16))
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color(.systemGray2))
                }

                // Body
                VStack(alignment: .leading, spacing: 10) {
                    // Text
                    Text(text)
                        .font(.system(size: 16))

                    // Image
                    if imageURL != "" && imageURL != nil {
                        AsyncImage(url: URL(string: imageURL!)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                    }

                    // Buttons with counts
                    HStack(alignment: .bottom, spacing: 0) {
                        HStack {
                            HStack (spacing: 5) {
                                Image(systemName: "bubble.left")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(white: 0.7))
                                Text(String(repliesCount))
                            }.frame(maxWidth: .infinity, alignment: .leading)

                            HStack (spacing: 5) {
                                Image(systemName: "repeat")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(.systemGray))
                                Text(String(repostsCount))
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack (spacing: 5) {
                                Image(systemName: "heart")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(.systemGray))
                                Text(String(likesCount))
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack (spacing: 5) {
                                Image(systemName: "chart.bar.xaxis")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(.systemGray))
                                Text(String(viewsCount))
                            }.frame(maxWidth: .infinity, alignment: .leading)
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(.trailing)

                        Image(systemName: "square.and.arrow.up")
                            .imageScale(.medium)
                            .foregroundColor(Color(.systemGray))
                    }
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
