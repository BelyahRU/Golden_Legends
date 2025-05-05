
//MARK: - Type of results
enum QuizResult: String {
    case boldChallenger = "testResult1"
    case calmExplorer = "testResult2"
    case fastReactor = "testResult3"
    case thoughtfulStrategist = "testResult4"
    case intuitiveThinker = "testResult5"
    case quietObserver = "testResult6"
}

//MARK: - Question Model
struct Question {
    let image: String
    let text: String
    let answer1: String
    let answer2: String
}

