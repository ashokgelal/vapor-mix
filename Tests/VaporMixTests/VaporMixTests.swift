import XCTest
@testable import VaporMix

class VaporMixTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(VaporMix().text, "Hello, World!")
    }


    static var allTests : [(String, (VaporMixTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
