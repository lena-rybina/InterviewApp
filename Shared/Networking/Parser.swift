//
//  Parser.swift
//  InterviewApp
//
//

import Foundation

extension Data {
    func map<T>(to: T.Type) throws -> T where T: Decodable {
        try JSONDecoder().decode(T.self,
                                 from: self)
    }
}
