
import SwiftUI

struct MainView: View {
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack(alignment: .bottom) {
                    Image("mainBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 8) {
                        VStack(spacing: 10) {
                            NavigationLink(destination:
                            QuizFlowView()
                                .navigationBarHidden(true)
                            ) {
                                Image("startGameButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 300)
                            }
                            NavigationLink(destination: SettingsView()) {
                                Image("settingsButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 300)
                            }
                        }
                        NavigationLink(destination: AboutView()) {
                            Image("aboutButton")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300)
                        }
                    }
                    .padding(.bottom,proxy.size.height < 650 ? 150 : 95)
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            
        }
    }
}


#Preview {
    MainView()
}
