
import SwiftUI

//MARK: - View with Chest
struct YouFindATrasureView: View {
    var onContinue: () -> Void // callBack on quiz

    var body: some View {
        ZStack(alignment: .bottom) {
            Image("treasureBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button {
                AudioManager.shared.playButtonEffect()
                onContinue()
            } label: {
                Image("continueButton")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 312)
            }
            .padding(.bottom, 70)
        }
    }
}

