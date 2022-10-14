//
//  TestingDemoUITests.swift
//  TestingDemoUITests
//
//  Created by admin on 29/09/22.
//

import XCTest
@testable import TestingDemo
final class TestingDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLayout() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        
        let res = app.staticTexts["Welcome to Synchronoss"] //write it exactly as written in the label , is case sensitive
        
        XCTAssertTrue(res.exists)
        
        let nameT = app.textFields["enter your name"]
        
        XCTAssertTrue(nameT.exists && nameT.isEnabled)
        
        let cBtn = app.buttons["Submit"]
        
        XCTAssertTrue(cBtn.exists && cBtn.isEnabled && cBtn.isHittable)
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testUserNameEntry() {
        
        let app = XCUIApplication()
        app.launch()
        
       let name = app.textFields["enter your name"]
        
        name.tap() //get the keyboard
        //name.typeText("john")
       let jKey = app.keys["j"]
        jKey.tap()
        
        let oKey = app.keys["o"]
         oKey.tap()
        
        let hKey = app.keys["h"]
         hKey.tap()
        
        let nKey = app.keys["n"]
        nKey.tap()
        
       app/*@START_MENU_TOKEN@*/.buttons["return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Submit"].tap()
        
        let title = app.staticTexts["Welcome John"]
        
        XCTAssertTrue(title.exists)
        
        
    }
    
    func testNoUsername() {
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["enter your name"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[1]]@END_MENU_TOKEN@*/.tap()
        let submitButton = app.buttons["Submit"]
        submitButton.tap()
     
        let title = app.staticTexts["Welcome"]
       
        XCTAssertFalse(title.exists)
        
        
    }
    
    func testTableContents() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["enter your name"].tap()
        app.typeText("John")
        app.buttons["Submit"].tap()
        
        let tablesQuery = app.tables
        
        let attach = XCTAttachment(screenshot: app.screenshot() )
        attach.name = "Second Screen"
        attach.lifetime = .keepAlways
        add(attach)
        
        
        XCTAssertEqual(4, tablesQuery.cells.count)
        
        let firstCell = tablesQuery.staticTexts["Open Account"]
        XCTAssertTrue(firstCell.exists)
        
        let secondCell = tablesQuery.staticTexts["Savings Account"]
        XCTAssertTrue(secondCell.exists)
        
        let thirdCell = tablesQuery.staticTexts["FD Account"]
        XCTAssertTrue(thirdCell.exists)
        
        let fourthCell = tablesQuery.staticTexts["RD Account"]
        XCTAssertTrue(fourthCell.exists)
        
    }
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
