import XCTest
@testable import BART

final class BARTTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BART().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
