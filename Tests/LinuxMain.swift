import XCTest

import BuyMeACoffeeTests

var tests = [XCTestCaseEntry]()
#if canImport(UIKit)
tests += BuyMeACoffeeTests.allTests()
#endif
XCTMain(tests)
