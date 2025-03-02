import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswer: String?
    @Published var score: Int = 0
    @Published var showResult: Bool = false

    var currentQuiz: Quiz? {
        quizzes.isEmpty ? nil : quizzes[currentIndex]
    }

    init() {
        quizzes = QuizLoader.loadQuizzes()
    }

    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        if answer == currentQuiz?.correctAnswer {
            score += 10
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.nextQuestion()
        }
    }

    func nextQuestion() {
        if currentIndex < quizzes.count - 1 {
            currentIndex += 1
        } else {
            showResult = true
        }
        selectedAnswer = nil
    }

    func restartQuiz() {
        currentIndex = 0
        score = 0
        showResult = false
    }
}