//
//  ResumeTests.swift
//  ResumeViewerTests
//
//  Created by Denis Efremov on 2019-11-01.
//  Copyright © 2019 Denis Efremov. All rights reserved.
//

import XCTest
@testable import ResumeViewer

class DataManagerTests: XCTestCase {
    
    let dataManager = DataManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testFileExists() {
//        // Given - "resume.json" file exists in the Documents folder
//        // When - DataManager checks for its existence
//        let result = dataManager.fileExistsInDocuments(filename: Constants.fileName)
//        // Then - the result of the check should be true
//        XCTAssertTrue(result, Constants.TestErrorMessages.fileExistsShouldNotBeFalse)
//    }
    
    func testFileDoesNotExist() {
        // Given - "resume.json" file does not exists in the Documents folder
        // When - DataManager checks for its existence
        let result = dataManager.fileExistsInDocuments(filename: Constants.fileName)
        // Then - the result of the check should be true
        XCTAssertFalse(result, Constants.TestErrorMessages.fileExistsShouldNotBeTrue)
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
