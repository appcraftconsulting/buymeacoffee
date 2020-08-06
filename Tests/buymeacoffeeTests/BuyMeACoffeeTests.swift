import Foundation
import XCTest
@testable import BuyMeACoffee

final class BuyMeACoffeeTests: XCTestCase {
    private let fileManager: FileManager = .default
    
    func testSnapshotButton() {
        guard let url = fileManager.urls(for: .downloadsDirectory, in: .userDomainMask).first else {
            XCTFail()
            return
        }
        
        var isDirectory: ObjCBool = false
        if !fileManager.fileExists(atPath: url.path, isDirectory: &isDirectory) || !isDirectory.boolValue {
            XCTAssertNoThrow(try fileManager.createDirectory(at: url, withIntermediateDirectories: false))
        }
        
        let button = BMCButton(frame: .init(x: 0, y: 0, width: 200, height: 50))
        button.configuration = .default
                
        if let data = button.snapshot().pngData() {
            let url = url.appendingPathComponent("bmc-button").appendingPathExtension("png")
            print(url.path)
            XCTAssertNoThrow(try data.write(to: url))
        } else {
            XCTFail()
        }
    }

    static var allTests = [
        ("snapshot button", testSnapshotButton),
    ]
}

fileprivate extension BMCButton {
    var size: CGSize {
        bounds.insetBy(dx: -layer.shadowOffset.width, dy: -layer.shadowOffset.height).size
    }
    
    func snapshot() -> UIImage {
        UIGraphicsImageRenderer(size: size).image { context in
            layer.render(in: context.cgContext)
        }
    }
}
