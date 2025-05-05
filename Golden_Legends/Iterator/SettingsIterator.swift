
import SwiftUI

//MARK: - Iterator for managing music effects
final class SettingsInteractor: ObservableObject {
    
    //music
    @Published var isMusicOn: Bool {
        didSet {
            SettingsStorage.isMusicOn = isMusicOn
            isMusicOn ? AudioManager.shared.playBackgroundMusic()
                      : AudioManager.shared.stopBackgroundMusic()
        }
    }

    //button effect
    @Published var isSoundEffectOn: Bool {
        didSet {
            SettingsStorage.isSoundEffectOn = isSoundEffectOn
        }
    }

    init() {
        self.isMusicOn = SettingsStorage.isMusicOn
        self.isSoundEffectOn = SettingsStorage.isSoundEffectOn
    }

    func toggleMusic() {
        isMusicOn.toggle()
    }

    
    func toggleSound() {
        isSoundEffectOn.toggle()
    }

    func playButtonSoundIfNeeded() {
        //if sound effect ON in SettingsView
        if isSoundEffectOn {
            AudioManager.shared.playButtonEffect()
        }
    }
}
