
import SwiftUI

struct QuizFlowView: View {
    @State private var currentStep = 0
    @State private var selectedAnswers: [Int?] = Array(repeating: nil, count: 5)
    @State private var selectedChests: [Int?] = Array(repeating: nil, count: 5)
    
    @State private var showingChest = false
    @State private var showingTreasure = false
    @State private var showResult = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        if showResult {
            ResultView(resultImageName: calculateResultImage(), onMain: {
                presentationMode.wrappedValue.dismiss()
            })
        } else if currentStep >= 5 {
            // Квиз завершен, показываем результат
            ResultView(resultImageName: calculateResultImage(), onMain: {
                presentationMode.wrappedValue.dismiss()
            })
        } else if showingTreasure {
            YouFindATrasureView {
                showingTreasure = false
                currentStep += 1
            }
        } else if showingChest {
            ChestsView { selectedChest in
                selectedChests[currentStep] = selectedChest
                showingChest = false
                showingTreasure = true
            }
        } else {
            QuizView(
                questionIndex: currentStep,
                onAnswerSelected: { answer in
                    selectedAnswers[currentStep] = answer
                    showingChest = true
                }
            )
        }
    }

    func calculateResultImage() -> String {
        var scores = [Int: Int]() // [resultIndex: count]

        for (index, answer) in selectedAnswers.enumerated() {
            guard let answer = answer else { continue }

            let resultIndex: Int
            switch index {
            case 0:
                resultIndex = (answer == 1) ? 5 : 4
            case 1:
                resultIndex = (answer == 1) ? 3 : 2
            case 2:
                resultIndex = (answer == 1) ? 1 : 6
            case 3:
                resultIndex = (answer == 1) ? 1 : 6
            case 4:
                resultIndex = (answer == 1) ? 1 : 4
            default:
                continue
            }

            scores[resultIndex, default: 0] += 1
        }

        let mostFrequent = scores.max { $0.value < $1.value }?.key ?? 1
        return "testResult\(mostFrequent)"
    }
}
