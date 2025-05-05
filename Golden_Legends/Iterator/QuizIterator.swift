
//MARK: - Iterator for Quiz
final class QuizInteractor {
    private(set) var selectedAnswers: [Int?] = Array(repeating: nil, count: 5) // contains answer on each question (1 or 2)
    private(set) var selectedChests: [Int?] = Array(repeating: nil, count: 5) // contains number of chest(1...9)
    
    func selectAnswer(_ answer: Int, for index: Int) {
        selectedAnswers[index] = answer
    }

    func selectChest(_ chest: Int, for index: Int) {
        selectedChests[index] = chest
    }

    func calculateResult() -> QuizResult {
        var scores = [QuizResult: Int]() // calculate scores
        
        for (index, answer) in selectedAnswers.enumerated() {
            guard let answer = answer else { continue }

            let result: QuizResult
            switch index {
            case 0:
                result = (answer == 1) ? .intuitiveThinker : .thoughtfulStrategist
            case 1:
                result = (answer == 1) ? .fastReactor : .calmExplorer
            case 2:
                result = (answer == 1) ? .boldChallenger : .quietObserver
            case 3:
                result = (answer == 1) ? .boldChallenger : .quietObserver
            case 4:
                result = (answer == 1) ? .boldChallenger : .thoughtfulStrategist
            default:
                continue
            }

            scores[result, default: 0] += 1
        }
        
        // return result with max value
        return scores.max(by: { $0.value < $1.value })?.key ?? .boldChallenger
    }
}
