
import AVFoundation
import SwiftUI

//MARK: - Manager for background music and button effect
final class AudioManager {
    static let shared = AudioManager()
    
    private var backgroundPlayer: AVAudioPlayer?
    private var buttonEffectPlayer: AVAudioPlayer?

    private init() {
        //MARK: - Initial settings
        prepareBackgroundMusic()
        prepareButtonEffect()
    }

    private func prepareBackgroundMusic() {
        if let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            backgroundPlayer = try? AVAudioPlayer(contentsOf: url)
            backgroundPlayer?.numberOfLoops = -1
            backgroundPlayer?.volume = 0.2 // small volume
        }
    }

    private func prepareButtonEffect() {
        if let url = Bundle.main.url(forResource: "buttonEffect", withExtension: "mp3") {
            buttonEffectPlayer = try? AVAudioPlayer(contentsOf: url)
            buttonEffectPlayer?.volume = 0.2 // small volume
            buttonEffectPlayer?.prepareToPlay()
        }
    }

    func playBackgroundMusic() {
        backgroundPlayer?.play()
    }

    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }

    func playButtonEffect() {
        // if is on --> play
        if SettingsStorage.isSoundEffectOn == true {
            buttonEffectPlayer?.currentTime = 0
            buttonEffectPlayer?.play()
        }
    }
}
