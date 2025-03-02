import Foundation

struct Quiz: Identifiable, Codable {
    let id: UUID = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
}