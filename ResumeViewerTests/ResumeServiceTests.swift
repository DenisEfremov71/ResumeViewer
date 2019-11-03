//
//  ResumeServiceTests.swift
//  ResumeViewerTests
//
//  Created by Denis Efremov on 2019-11-02.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import XCTest
@testable import ResumeViewer

class ResumeServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
