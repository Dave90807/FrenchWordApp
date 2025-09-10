// Word.swift
import Foundation

struct Word: Identifiable, Codable {
    let id: UUID
    let french: String
    let english: String
    
    init(french: String, english: String) {
        self.id = UUID()
        self.french = french
        self.english = english
    }
    
    enum CodingKeys: String, CodingKey {
        case id, french, english
    }
}

struct Answer: Codable {
    let wordId: UUID // Lowercase 'd'
    let isCorrect: Bool
    let timestamp: Date
}
