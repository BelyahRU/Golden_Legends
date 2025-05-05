

import SwiftUI

struct ResultView: View {
    let resultImageName: String
    
    var onMain: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(resultImageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button {
                onMain()
            } label: {
                Image("enterTheGoldenRoomButton")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 342)
            }
            .padding(.bottom, 70)
        }
    }
}
