//
//  DSN_EuropeUITests.swift
//  DSN EuropeUITests
//
//  Created by Christian Brechbuhl on 3/15/20.
//  Copyright © 2020 ForceMobileStudios. All rights reserved.
//

import XCTest
@testable import DSN_Converter
class DSN_EuropeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
                        app.launchArguments.append("ui-testing")
                        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
       func testRamstein480() {
           // UI tests must launch the application that they test.
           let app = XCUIApplication()
           app.launch()
    
           app.buttons["4 GHI"].tap()
           app.buttons["8 TUV"].tap()
           app.buttons["0 +"].tap()
           
           let button = app.buttons["2 ABC"]
           button.tap()
           
           let button2 = app.buttons["5 JKL"]
           button2.tap()
           button.tap()
           button2.tap()
           app.buttons["phoneIcon"].tap()
           app.staticTexts["Ramstein AB"].tap()
           app.navigationBars["DSN Lookup"].buttons["Stop"].tap()
           
       }
       
       func testAviano(){
           
           let app = XCUIApplication()
           app.launch()
           app.buttons["6 MNO"].tap()
           
           let button = app.buttons["3 DEF"]
           button.tap()
           
           let button2 = app.buttons["2 ABC"]
           button2.tap()
           app.buttons["1"].tap()
           button2.tap()
           button.tap()
           app.buttons["4 GHI"].tap()
           app.buttons["phoneIcon"].tap()
           app.staticTexts["Aviano AB"].tap()
           app.navigationBars["DSN Lookup"].buttons["Stop"].tap()
           
       }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
