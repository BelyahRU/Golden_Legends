import SwiftUI

struct QuizView: View {
    let questionIndex: Int
    let onAnswerSelected: (Int) -> Void

    @State private var selectedAnswer: Int? = nil

    let questions = [
        ("question1Image", "question1", "anwer_1_1", "anwer_1_2"),
        ("question2Image", "question2", "anwer_2_1", "anwer_2_2"),
        ("question3Image", "question3", "anwer_3_1", "anwer_3_2"),
        ("question4Image", "question4", "anwer_4_1", "anwer_4_2"),
        ("question5Image", "question5", "anwer_5_1", "anwer_5_2")
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
                    Image(question.0)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 315)

                    Image(question.1)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 280)
                }
                .padding(.top, 59)

                Button {
                    selectedAnswer = 1
                } label: {
                    Image(question.2)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 307)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectedAnswer == 1 ? Color.white : Color.clear, lineWidth: 2))
                }

                Button {
                    selectedAnswer = 2
                } label: {
                    Image(question.3)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 307)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectedAnswer == 2 ? Color.white : Color.clear, lineWidth: 2))
                }

                Button {
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
