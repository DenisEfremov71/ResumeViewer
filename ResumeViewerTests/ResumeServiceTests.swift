import XCTest
@testable import ResumeViewer

class ResumeServiceTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testGetResume() {
        let exp = expectation(description: Constants.TestExpectations.getResume)
        
        let service = ResumeService()
        
        service.getResumeFromGist { (resume, error) in
            XCTAssertNil(error, Constants.TestErrorMessages.getResumeFromGistErrorShouldBeNil)
            XCTAssertNotNil(resume, Constants.TestErrorMessages.getResumeFromGistResumeShouldNotBeNil)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            print(error?.localizedDescription ?? "no error")
        }
    }
    
    func testGetResumeFailed() {
        let service = MockResumeService()
        
        service.getResumeFromGist { (resume, error) in
            XCTAssertNotNil(error, Constants.TestErrorMessages.getResumeFromGistErrorShouldNotBeNil)
            XCTAssertNil(resume, Constants.TestErrorMessages.getResumeFromGistResumeShouldBeNil)
        }
    }

}
