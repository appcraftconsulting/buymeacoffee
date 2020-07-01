import XCTest
@testable import BuyMeACoffee

final class BuyMeACoffeeTests: XCTestCase {
    func testExample() {
        let button = BMCButton()
        button.start()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
