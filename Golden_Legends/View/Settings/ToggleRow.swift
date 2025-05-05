
import SwiftUI

//MARK: - Row for sound settings, contains label name(music or button Effect) and on/off button
struct ToggleRow: View {
    let labelImage: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: 16) {
            // music/buttonEffect
            Image(labelImage)
                .resizable()
                .scaledToFit()
                .frame(width: 218)
            
            // on/off
            Button {
                AudioManager.shared.playButtonEffect()
                isOn.toggle()
            } label: {
                Image(isOn ? "onButton" : "offButton")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 125)
            }
        }
    }
}
