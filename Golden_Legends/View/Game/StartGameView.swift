
import SwiftUI

struct StartGameView: View {
    var body: some View {
        ZStack {
            Image("baseBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
