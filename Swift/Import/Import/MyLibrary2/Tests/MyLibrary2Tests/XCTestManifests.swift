import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MyLibrary2Tests.allTests),
    ]
}
#endif
