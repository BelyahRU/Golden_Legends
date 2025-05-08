
import SwiftUI

//MARK: - Quiz
struct QuizView: View {
    let questionIndex: Int
    let onAnswerSelected: (Int) -> Void

    @State private var selectedAnswer: Int? = nil

    //image names for quiz
    
    
    let questions = [
        ("question1Image", "q1", "anwer_1_1", "anwer_1_2"),
        ("question2Image", "q2", "anwer_2_1", "anwer_2_2"),
        ("question3Image", "q3", "anwer_3_1", "anwer_3_2"),
        ("question4Image", "q4", "anwer_4_1", "anwer_4_2"),
        ("question5Image", "q5", "anwer_5_1", "anwer_5_2")
    ]

    var body: some View {
        let question = questions[questionIndex]

        ZStack {
            Image("baseBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 30) {
                    //MARK: - Question№1, Question№2, Question№3...
                    Image(question.0)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 315)

                    //MARK: - Main Question
                    Image(question.1)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 280)
                }
                .padding(.top, 59)

                //MARK: - Answer 1
                Button {
                    AudioManager.shared.playButtonEffect()
                    selectedAnswer = 1
                } label: {
                    Image(question.2)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 307)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectedAnswer == 1 ? Color.white : Color.clear, lineWidth: 2))
                }

                //MARK: - Answer 2
                Button {
                    AudioManager.shared.playButtonEffect()
                    selectedAnswer = 2
                } label: {
                    Image(question.3)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 307)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectedAnswer == 2 ? Color.white : Color.clear, lineWidth: 2))
                }

                //MARK: - Next button
                Button {
                    AudioManager.shared.playButtonEffect()
                    if let answer = selectedAnswer {
                        onAnswerSelected(answer)
                    }
                } label: {
                    Image("nextButton")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 219)
                }
                .padding(.top, 20)
            }
        }
    }
}
