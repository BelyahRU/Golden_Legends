
import SwiftUI

final class QuizPresenter: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var state: QuizFlowState = .question // current state
    @Published var result: QuizResult = .boldChallenger 

    private let interactor = QuizInteractor()

    // saving answer on questing
    func submitAnswer(_ answer: Int) {
        interactor.selectAnswer(answer, for: currentStep)
        state = .chest
    }

    // saving selected chest
    func submitChest(_ chest: Int) {
        interactor.selectChest(chest, for: currentStep)
        state = .treasure
    }

    // changing QuizFlowView state
    func nextStep() {
        if currentStep >= 4 {
            result = interactor.calculateResult()
            state = .result
        } else {
            currentStep += 1
            state = .question
        }
    }

}

