import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel = QuizViewModel()

    var body: some View {
        VStack {
            if let quiz = viewModel.currentQuiz {
                Text(quiz.question)
                    .font(.title2)
                    .padding()

                ForEach(quiz.options, id: \.self) { option in
                    Button(action: { viewModel.selectAnswer(option) }) {
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.selectedAnswer == option ?
                                        (option == quiz.correctAnswer ? Color.green : Color.red) :
                                        Color.gray.opacity(0.3))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }

            Spacer()

            Text("Score: \(viewModel.score)")
                .font(.headline)
                .padding()

            if viewModel.showResult {
                Button("Restart") {
                    viewModel.restartQuiz()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
    }
}