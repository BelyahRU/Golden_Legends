
import SwiftUI

//MARK: - Router for navigation
enum MainRoute {
    case quiz, settings, about
}

//MARK: - Main View in project, contains navigation on other views
struct MainView: View {
    @State private var selectedRoute: MainRoute?
    @StateObject private var interactor = SettingsInteractor()

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
                            //MARK: - Start game
                            Button {
                                AudioManager.shared.playButtonEffect()
                                selectedRoute = .quiz
                            } label: {
                                Image("startGameButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 300)
                            }
                            
                            //MARK: - Settings
                            Button {
                                AudioManager.shared.playButtonEffect()
                                selectedRoute = .settings
                            } label: {
                                Image("settingsButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 300)
                            }
                        }

                        //MARK: - About
                        Button {
                            AudioManager.shared.playButtonEffect()
                            selectedRoute = .about
                        } label: {
                            Image("aboutButton")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300)
                        }
                    }
                    .padding(.bottom, proxy.size.height < 650 ? 150 : 95)

                    
                    //MARK: - Navigation
                    NavigationLink(destination: QuizFlowView().navigationBarHidden(true), tag: .quiz, selection: $selectedRoute) { EmptyView() }
                    NavigationLink(destination: SettingsView(presenter: SettingsPresenter()).navigationBarHidden(true), tag: .settings, selection: $selectedRoute) { EmptyView() }
                    NavigationLink(destination: AboutView().navigationBarHidden(true), tag: .about, selection: $selectedRoute) { EmptyView() }
                }
            }
            .onAppear {
                if interactor.isMusicOn {
                    AudioManager.shared.playBackgroundMusic()
                }
            }
        }
    }
}
