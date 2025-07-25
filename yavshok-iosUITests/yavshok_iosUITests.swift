//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by Denis Bocha on 23.07.2025.
//

import XCTest

final class yavshok_iosUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    func testTyoesEmailMainScreen(){
        app.launch()
        
        let emailField = app.textFields["emailInput"].firstMatch
        
        XCTAssert(app.staticTexts["mainTitle"].firstMatch.waitForExistence(timeout: 5))
        XCTAssert(emailField.waitForExistence(timeout: 5))
        emailField.tap()
        emailField.typeText("email@email.ru")
        XCTAssert(emailField.value.debugDescription.contains("email@email.ru"))
    }
    
    func testMainInLogin(){
        app.launch()
        
        let buttonInShok = app.buttons["navigationButton"].firstMatch
        
        XCTAssert(app.staticTexts["mainTitle"].firstMatch.waitForExistence(timeout: 5))
        buttonInShok.tap()
        let app = XCUIApplication()
        app.activate()
        XCTAssert(app.staticTexts["loginTitle"].firstMatch.waitForExistence(timeout: 5))
    }
    
    
}
