import XCTest
@testable import ResumeViewer

class DataManagerTests: XCTestCase {
    
    let dataManager = DataManager()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testParseJSON() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "resume", ofType: "json") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let result = dataManager.parseJSON(data: data)
                XCTAssertNotNil(result!, Constants.TestErrorMessages.jsonResultShouldNotBeNil)
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }

}
