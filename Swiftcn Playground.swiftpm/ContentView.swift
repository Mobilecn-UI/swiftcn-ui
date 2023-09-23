import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""

    var body: some View {
        
        ZStack{
            
            DotPattern(dotColor: .black, spacing: 5, brightness: 0.2, backgroundColor: .white  )
            VStack(spacing: 20) {
                
    
                
                CustomButton(action: {
                    print("Button tapped!")
                }, label: "Button")
                
                // NOTE: could move $inputText to Input component
                CustomInput(
                    text: $inputText, iconName: "envelope", placeholder: "Email"
                )
                
                CustomAvatar(
                    imageURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
                    fallbackText: "SS",
                    width: 100,
                    height: 100
                )
                
                CustomSlider()
                
                CustomToggle(
                    label: "Toggle me"
                )
            }
            .padding(.horizontal, 20)
        }
    }
}
