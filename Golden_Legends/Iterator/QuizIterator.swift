
//MARK: - Iterator for Quiz
final class QuizInteractor {
    private(set) var allQuestions: [Question] = []
    private(set) var selectedQuestions: [Question] = []
    private(set) var selectedAnswers: [Int?] = Array(repeating: nil, count: 10)
    private(set) var selectedChests: [Int?] = Array(repeating: nil, count: 10)

    init() {
        allQuestions = (1...24).map { index in
            Question(
                id: index,
                image: "q\(index)",
                text: QuizData.text(for: index),
                answer1: QuizData.answer1(for: index),
                answer2: QuizData.answer2(for: index)
            )
        }

        selectedQuestions = Array(allQuestions.shuffled().prefix(10))
    }

    func selectAnswer(_ answer: Int, for index: Int) {
        selectedAnswers[index] = answer
    }

    func selectChest(_ chest: Int, for index: Int) {
        selectedChests[index] = chest
    }

    func getQuestion(for index: Int) -> Question {
        selectedQuestions[index]
    }

    func calculateResult() -> QuizResult {
        var scores = [QuizResult: Int]()

        for (index, answer) in selectedAnswers.enumerated() {
            guard let answer = answer else { continue }
            let question = selectedQuestions[index]

            let result = QuizData.resultMapping(for: question.id, answer: answer)
            scores[result, default: 0] += 1

            print("Q\(index + 1) (id: \(question.id)): Answer \(answer) → \(result.rawValue)")
        }

        if let max = scores.max(by: { $0.value < $1.value }) {
            print("Final result: \(max.key.rawValue) with score: \(max.value)")
            return max.key
        } else {
            print("No answers found, returning default result")
            return .boldChallenger
        }
    }

}
