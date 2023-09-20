import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""

       var body: some View {
           VStack(spacing: 20) {
               CustomButton(action: {
                   print("Button tapped!")
               }, label: "Button")

               // TODO: pass symbol to input (optional parameter)
               // NOTE: could move $inputText to Input component
               CustomInput(text: $inputText, placeholder: "Email")

               CustomAvatar(imageURL: "https://avatars.githubusercontent.com/u/53033648?v=4",
                                 fallbackText: "FallBack",
                                 width: 100,
                                 height: 100,
                                 fallbackColor: Color.red)

               CustomSlider()
           }
           .padding(.horizontal, 20)
       }
}
