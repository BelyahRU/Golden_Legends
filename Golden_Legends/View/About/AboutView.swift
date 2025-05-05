
import SwiftUI

//MARK: - View with some words about project
struct AboutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("baseBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                //text about project
                Image("aboutProjectImage")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                
                
                Button {
                    AudioManager.shared.playButtonEffect()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("backButton")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}
