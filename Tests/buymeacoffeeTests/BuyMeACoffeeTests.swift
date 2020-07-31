import XCTest
@testable import BuyMeACoffee

final class BuyMeACoffeeTests: XCTestCase {
    func testScreenshotButton() {
        guard let url = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }
        
        var isDirectory: ObjCBool = false
        if !(FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory) && isDirectory.boolValue) {
            XCTAssertNoThrow(try FileManager.default.createDirectory(at: url, withIntermediateDirectories: false, attributes: nil))
        }
        
        let button = BMCButton(frame: .init(x: 0, y: 0, width: 300, height: 40))
        button.configuration = .default
                
        if let data = button.screenshot().pngData() {
            let url = url.appendingPathComponent("button.png")
            XCTAssertNoThrow(try data.write(to: url))
        } else {
            XCTFail()
        }
    }

    static var allTests = [
        ("screenshot button", testScreenshotButton),
    ]
}

fileprivate extension UIView {
    func screenshot() -> UIImage {
        UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
        }
    }
}
