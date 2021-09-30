//
//  Post.swift
//  InterviewApp
//
//

import Foundation

struct PredictionsContainer: Codable {
    let predictions: [Prediction]
}

struct Prediction: Codable {
    let structuredFormatting: StructuredFormatting
    
    enum CodingKeys: String, CodingKey {
        case structuredFormatting = "structured_formatting"
    }
}

struct StructuredFormatting: Codable {
    let mainText: String
    let secondaryText: String
    
    enum CodingKeys: String, CodingKey {
        case mainText = "main_text"
        case secondaryText = "secondary_text"
    }
}
