
import SwiftUI

//MARK: - View with Chest
struct YouFindATrasureView: View {
    var onContinue: () -> Void // callBack on quiz

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
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
                .position(x: proxy.size.width / 2, y: proxy.size.height - 80)
            }
        }
    }
}

