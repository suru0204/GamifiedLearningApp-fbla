import Foundation

class QuizLoader {
    static func loadQuizzes() -> [Quiz] {
        guard let url = Bundle.main.url(forResource: "quizData", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
            return quizzes
        } catch {
            print("Error loading quizzes: \(error)")
            return []
        }
    }
}