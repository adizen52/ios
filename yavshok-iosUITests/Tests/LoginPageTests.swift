//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by Denis Bocha on 23.07.2025.
//

import XCTest

final class LoginPageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPge = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
   
    override func setUp () {
        super.setUp()
        
        app.launch()
        
        mainPge
            .displaedLoginButton()
            .tapLoginButton()
        
    }
    
    func testAllElemetLoginPageDisplayed(){
        
        loginPage
            .displayedScreenTitle()
            .displayedEmailField()
            .displayedPasswordField()
            .displayedLoginButton()
            .displayedRegisterButton()
            .displayedBackButton()    
    }
    
    func testPlaceholdersLoginPage(){
        
        loginPage
            .displayedEmailField()
            .placeholderEmailText()
            .displayedPasswordField()
            .placeholderPasswordText()
    }
    
    func testLoginEmptyPassword(){
        let email = "adizzen@ya.ru"
        loginPage
            .inputEmail(email)
            .buttonLoginIsNotEnable()
    }
    
    func testLoginEmptyEmail(){
        let password = "123456"
        loginPage
            .inputPassword(password)
            .buttonLoginIsNotEnable()
    }
    
    func testIncorrectEmail(){
        let email = "adizzen@yandex.ru"
        let password = "123456"
        loginPage
            .inputEmail(email)
            .inputPassword(password)
            .tapLoginButton()
            .displayedValidationError()
    }
    
    func testBackButton(){
        loginPage
            .tapBackButton()
        mainPge
            .displaedTitle()
    }
    
    func testRegisterButton(){
        loginPage
            .tapRegisterButton()
        registerPage
            .displayedRegisterTitle()
    }
    
    func testSucsessionLogin(){
        let email = "adizen@ya.ru"
        let password = "123456"
        loginPage
            .inputEmail(email)
            .inputPassword(password)
            .tapLoginButton()
        profilePage
            .displayedUserName()
            .tapLogoutButton()
    }
    
    
    
    
    
    
    
    
    
}
