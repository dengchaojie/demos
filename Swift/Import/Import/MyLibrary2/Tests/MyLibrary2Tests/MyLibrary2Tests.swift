import XCTest
@testable import MyLibrary2

final class MyLibrary2Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MyLibrary2().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
