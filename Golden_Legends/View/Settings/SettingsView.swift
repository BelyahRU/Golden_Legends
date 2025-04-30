
import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isMusicOn = true
    @State var isSoundEffectOn = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("settingsBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 90) {
                    VStack(spacing: 40) {
                        HStack(spacing: 16) {
                            Image("musicLabelImage")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 80)
                            Button {
                                isMusicOn.toggle()
                            } label: {
                                Image(isMusicOn ? "onButton": "offButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 125)
                            }
                        }
                        HStack(spacing: 16) {
                            Image("soundEffectsLabelImage")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 90)
                            Button {
                                isSoundEffectOn.toggle()
                            } label: {
                                Image(isSoundEffectOn ? "onButton": "offButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 125)
                            }
                        }
                    }
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("backButton")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                    }
                }
                
            }
            .padding(.bottom, 65)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}
