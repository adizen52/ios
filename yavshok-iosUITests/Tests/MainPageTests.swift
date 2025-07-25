//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by Denis Bocha on 23.07.2025.
//

import XCTest

final class MainPageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPge = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }
    
    
    func testAllElemetMainPageDisplayed(){
        app.launch()
        
        mainPge
            .displaedTitle()
            .displaedEmailInput()
            .displaedCheckButton()
            .displaedLoginButton()
    }
    
    func testPlaceholderInMainPage(){
        app.launch()
        
        mainPge
            .displaedTitle()
            .displaedEmailInput()
            .placeholderEmailInput()
    }
    
    func testExistEmailInBaseTrue(){
        app.launch()
        
        let email : String = "adizen@ya.ru"
        
        mainPge
            .displaedTitle()
            .checkEmail(email)
            .tapCheckButton()
            .displaedSuccessText()
            .displaedRecheckButton()
            .displaedSuccessNavigationButton()
    }
    
    func testExisteEmailInBaseFalse(){
        app.launch()
        
        let email : String = "adizens@ya.ru"
        
        mainPge
            .displaedTitle()
            .checkEmail(email)
            .tapCheckButton()
            .displaedStaticTextEmailFalse()
            .displaedFailureRecheckButton()
            .displaedFailureNavigationButton()
    }
    
    func testRepeatCheckEmailTrueAndFalse(){
        app.launch()
        
        let email : String = "adizen@ya.ru"
        let badEmail : String = "adizens@yandex.ru"
        
        mainPge
            .displaedTitle()
            .checkEmail(email)
            .tapCheckButton()
            .displaedSuccessText()
            .displaedRecheckButton()
            .displaedSuccessNavigationButton()
            .clearSuccessEmailInput(app: app)
            .inputSuccessEmailInput(email: badEmail)
            .tapRecheckButton()
            .displaedFailureEmailInput()
            .displaedFailureRecheckButton()
            .displaedFailureNavigationButton()
    }
    
    func testRepeatChackEmailFalseAndTrue(){
        app.launch()
        
        let email : String = "adizen@ya.ru"
        let badEmail : String = "adizens@yandex.ru"
        
        mainPge
            .displaedTitle()
            .checkEmail(badEmail)
            .tapCheckButton()
            .displaedFailureEmailInput()
            .displaedFailureRecheckButton()
            .displaedFailureNavigationButton()
            .clearFailureEmailInput(app: app)
            .inputFailureEmailInput(email: email)
            .tapFailureRecheckButton()
            .displaedSuccessEmailInput()
            .displaedSuccessText()
            .closeKeyboard(app: app)
            .displaedSuccessNavigationButton()
            .displaedRecheckButton()
    }
    
    func testNavigateToLoginPage(){
        app.launch()
        
        let email : String = "adizen@ya.ru"
        
        mainPge
            .displaedTitle()
            .checkEmail(email)
            .tapCheckButton()
            .closeKeyboard(app: app)
            .tapSuccessNavigationButton()
        loginPage
            .displayedScreenTitle()
            
    }
    
    func testButtonShokNotEnabled() throws {
        try XCTSkipIf(true, "Баг, полле ввода должно валидировать email")
        let str : String = "123"
        mainPge
            .displaedTitle()
            .checkEmail(str)
            .displaedCheckButton()
            .checkButtonNotEnable()
    }
    
    
    
}
