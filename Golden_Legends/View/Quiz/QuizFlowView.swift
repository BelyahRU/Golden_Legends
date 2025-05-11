
import SwiftUI

//MARK: - View which manage screens in Quiz
struct QuizFlowView: View {
    @StateObject private var presenter = QuizPresenter()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Group {
            switch presenter.state {
                
            //MARK: - ResultView
            case .result:
                ResultView(resultImageName: presenter.result.rawValue) {
                    presentationMode.wrappedValue.dismiss()
                }
                
            //MARK: - YouFindATrasureView
            case .treasure:
                YouFindATrasureView {
                    presenter.nextStep()
                }
                
            //MARK: - ChestsView
            case .chest:
                ChestsView { chest in
                    presenter.submitChest(chest)
                }

            //MARK: - QuizView
            case .question:
                QuizView(
                    question: presenter.getCurrentQuestion(),
                    displayIndex: presenter.currentStep
                ) { answer in
                    presenter.submitAnswer(answer)
                }

            }
        }
    }
}
