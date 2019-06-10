import XCTest
@testable import BART

final class BARTTests: XCTestCase {
    func testSharedApiKey() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
         XCTAssertEqual(APIService.apiKey, "MW9S-E7SL-26DU-VV8V")
    }

    static var allTests = [
        ("testSharedApiKey", testSharedApiKey),
    ]
}
