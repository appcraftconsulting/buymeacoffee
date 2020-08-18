import XCTest

#if !canImport(ObjectiveC) && canImport(UIKit)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(buymeacoffeeTests.allTests),
    ]
}
#else
public func allTests() -> [XCTestCaseEntry] {
    return []
}
#endif
