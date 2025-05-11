
enum QuizData {
    static func text(for id: Int) -> String {
        switch id {
        case 1: return "HOW DO YOU DECIDE?"
        case 2: return "YOUR PACE?"
        case 3: return "TAKE RISK?"
        case 4: return "NEW CHALLENGE?"
        case 5: return "BEST FIT?"
        case 6: return "CHOOSE A PATH:"
        case 7: return "WHAT DRIVES YOU?"
        case 8: return "YOUR STYLE?"
        case 9: return "MORE IMPORTANT?"
        case 10: return "FAVORITE TIME?"
        case 11: return "WHEN YOU WIN?"
        case 12: return "HOW DO YOU THINK?"
        case 13: return "IN A TEAM?"
        case 14: return "HOW DO YOU REACT?"
        case 15: return "FACING A PROBLEM?"
        case 16: return "FAVORITE TASK?"
        case 17: return "IN A GAME?"
        case 18: return "WHAT’S BETTER?"
        case 19: return "YOUR ENERGY?"
        case 20: return "PICK A SYMBOL:"
        case 21: return "BIG DECISIONS?"
        case 22: return "PICK A VIBE:"
        case 23: return "PREFER TO..."
        case 24: return "FOLLOW OR LEAD?"
        default: return ""
        }
    }

    static func answer1(for id: Int) -> String {
        switch id {
        case 1: return "INSTINCT"
        case 2: return "FAST"
        case 3: return "ALWAYS"
        case 4: return "JUMP IN"
        case 5: return "BOLD"
        case 6: return "SAFE"
        case 7: return "GOALS"
        case 8: return "SIMPLE"
        case 9: return "SPEED"
        case 10: return "DAY"
        case 11: return "CELEBRATE"
        case 12: return "VISUAL"
        case 13: return "LEADER"
        case 14: return "QUICKLY"
        case 15: return "SOLVE IT"
        case 16: return "EASY"
        case 17: return "RISK"
        case 18: return "ACTION"
        case 19: return "HIGH"
        case 20: return "FIRE"
        case 21: return "NOW"
        case 22: return "CALM"
        case 23: return "WATCH"
        case 24: return "LEAD"
        default: return ""
        }
    }

    static func answer2(for id: Int) -> String {
        switch id {
        case 1: return "LOGIC"
        case 2: return "CALM"
        case 3: return "RARELY"
        case 4: return "WATCH FIRST"
        case 5: return "THOUGHTFUL"
        case 6: return "UNKNOWN"
        case 7: return "EMOTIONS"
        case 8: return "COMPLEX"
        case 9: return "ACCURACY"
        case 10: return "NIGHT"
        case 11: return "MOVE ON"
        case 12: return "LOGICAL"
        case 13: return "SUPPORT"
        case 14: return "CAREFULLY"
        case 15: return "AVOID IT"
        case 16: return "CHALLENGING"
        case 17: return "DEFENSE"
        case 18: return "STRATEGY"
        case 19: return "BALANCED"
        case 20: return "WATER"
        case 21: return "LATER"
        case 22: return "INTENSE"
        case 23: return "ACT"
        case 24: return "FOLLOW"
        default: return ""
        }
    }

    static func resultMapping(for id: Int, answer: Int) -> QuizResult {
        // Пример распределения:
        switch id {
        case 1, 7, 12, 24:
            return (answer == 1) ? .intuitiveThinker : .thoughtfulStrategist
        case 2, 14, 19:
            return (answer == 1) ? .fastReactor : .calmExplorer
        case 3, 4, 5, 17, 21, 23:
            return (answer == 1) ? .boldChallenger : .quietObserver
        case 6, 13, 18, 22:
            return (answer == 1) ? .quietObserver : .boldChallenger
        case 8, 9, 10, 11, 15, 16, 20:
            return (answer == 1) ? .fastReactor : .thoughtfulStrategist
        default:
            return .boldChallenger
        }
    }
}
