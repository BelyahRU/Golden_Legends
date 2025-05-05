
import SwiftUI

enum SettingsKeys {
    static let isMusicOn = "isMusicOn"
    static let isSoundEffectOn = "isSoundEffectOn"
}

//MARK: - Contains Settings off sound in UserDefaults
final class SettingsStorage {
    static var isMusicOn: Bool {
        get { UserDefaults.standard.object(forKey: SettingsKeys.isMusicOn) as? Bool ?? true }
        set { UserDefaults.standard.set(newValue, forKey: SettingsKeys.isMusicOn) }
    }

    static var isSoundEffectOn: Bool {
        get { UserDefaults.standard.object(forKey: SettingsKeys.isSoundEffectOn) as? Bool ?? false }
        set { UserDefaults.standard.set(newValue, forKey: SettingsKeys.isSoundEffectOn) }
    }
}
