
import SwiftUI

//MARK: - View which manages audio settings
struct SettingsView: View {
    @ObservedObject var presenter: SettingsPresenter
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .bottom) {
            Image("settingsBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 90) {
                VStack(spacing: 40) {
                    //MARK: - Music
                    ToggleRow(labelImage: "musicLabelImage", isOn: $presenter.interactor.isMusicOn)
                    //MARK: - Button effect
                    ToggleRow(labelImage: "soundEffectsLabelImage", isOn: $presenter.interactor.isSoundEffectOn)
                }
                
                //MARK: - Back button
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
            .padding(.bottom, 65)
        }
        .navigationBarHidden(true)
    }
}
