
import SwiftUI

//MARK: - Iterator for selecting one from nine chests
final class ChestInteractor: ObservableObject {
    @Published var selectedIndex: Int? = nil

    func select(index: Int) {
        selectedIndex = selectedIndex == index ? nil : index
    }
}
