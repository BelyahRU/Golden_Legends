
import SwiftUI

//MARK: - Quiz

struct QuizView: View {
    let question: Question // теперь напрямую передаём вопрос
    let displayIndex: Int // 0...9
    let onAnswerSelected: (Int) -> Void

    @State private var selectedAnswer: Int? = nil

    var body: some View {
        ZStack {
            
            Image("baseBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 15) {
                //MARK: - Question image
                Image("question\(displayIndex + 1)Image")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 315)

                //MARK: - Question text
                Image(question.image) // это q1...q24
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 280)

                //MARK: - Answer 1
                Button {
                    AudioManager.shared.playButtonEffect()
                    selectedAnswer = 1
                } label: {
                    Image("anwer_\(question.id)_1")
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
                    Image("anwer_\(question.id)_2")
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
                .padding(.bottom, 5)
            }
            .padding(.vertical, 30)
        }
        .onAppear {
            print("Now showing question #\(displayIndex + 1) (original id: \(question.id))")
        }
    }
}
