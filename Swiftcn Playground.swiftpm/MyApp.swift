import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Examples", systemImage: "scribble.variable")
                    }
                XHomeView()
                    .tabItem {
                         Label("X Home", systemImage: "x.circle")
                    }
            }
        }
    }
}
