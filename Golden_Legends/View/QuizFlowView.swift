
import SwiftUI

struct QuizFlowView: View {
    @State private var currentStep = 0
    @State private var selectedAnswers: [Int?] = Array(repeating: nil, count: 5)
    @State private var selectedChests: [Int?] = Array(repeating: nil, count: 5)
    @State private var showingChest = false

    var body: some View {
        if currentStep >= 5 {
            // Квиз завершен
            VStack {
                Text("Quiz Complete!")
                    .font(.largeTitle)
                ForEach(0..<5) { i in
                    Text("Q\(i + 1): A\(selectedAnswers[i] ?? 0), Chest: \(selectedChests[i].map { $0 + 1 } ?? 0)")
                }
            }
        } else if showingChest {
            ChestsView { selectedChest in
                selectedChests[currentStep] = selectedChest
                currentStep += 1
                showingChest = false
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
}

