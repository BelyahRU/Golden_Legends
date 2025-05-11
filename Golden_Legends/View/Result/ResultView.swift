

import SwiftUI

//MARK: - View which contains result of quiz. It calculated in QuizIterator
struct ResultView: View {
    let resultImageName: String
    
    var onMain: () -> Void

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Image(resultImageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                //MARK: - End quiz, back on MainView
                Button {
                    AudioManager.shared.playButtonEffect()
                    onMain()
                } label: {
                    Image("enterTheGoldenRoomButton")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 342)
                }
                .position(x: proxy.size.width / 2, y: proxy.size.height - 80)
            }
        }
    }
}
