//
//  InterviewAppTests.swift
//  InterviewAppTests
//
//
//

@testable import InterviewApp
import XCTest

class InterviewAppTests: XCTestCase {
    func testPostDecoding() {
        // Get current bundle
        let bundle = Bundle(for: InterviewAppTests.self)
        
        // Get post mock
        let path = bundle.path(forResource: "post",
                               ofType: "json")!
        
        // Get contents of json as data
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        // Try to decode
        XCTAssertNoThrow(try JSONDecoder().decode(Post.self,
                                                  from: data))
    }
}
