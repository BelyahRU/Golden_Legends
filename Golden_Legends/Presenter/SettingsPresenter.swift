
import SwiftUI

//MARK: - Presenter for settings
final class SettingsPresenter: ObservableObject {
    @Published var interactor: SettingsInteractor

    init(interactor: SettingsInteractor = SettingsInteractor()) {
        self.interactor = interactor
    }
}

