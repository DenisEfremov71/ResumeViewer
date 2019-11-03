import XCTest

class ResumeViewerUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testResumeTable() {
        let app = XCUIApplication()
        let exists = NSPredicate(format: "exists == 1")
        let cellWorkExperience = app.tables.cells.staticTexts["Work Experience"]
        expectation(for: exists, evaluatedWith: cellWorkExperience, handler: nil)
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testWorkingExperience() {
        let app = XCUIApplication()
        app.tables.cells.staticTexts["Work Experience"].tap()
        let exists = NSPredicate(format: "exists == 1")
        let companyLogo = app.scrollViews.otherElements.containing(.staticText, identifier:"Freightera Logistics").element
        expectation(for: exists, evaluatedWith: companyLogo, handler: nil)
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformance() {
        self.measure {
            let app = XCUIApplication()
            app.tables/*@START_MENU_TOKEN@*/.staticTexts["Work Experience"]/*[[".cells.staticTexts[\"Work Experience\"]",".staticTexts[\"Work Experience\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            let scrollViewsQuery = app.scrollViews
            scrollViewsQuery.otherElements.staticTexts["Freightera Logistics"].swipeUp()
            app.navigationBars["Work Experience"].buttons["Resume"].tap()
        }
    }

}
