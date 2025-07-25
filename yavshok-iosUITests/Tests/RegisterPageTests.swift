//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by Denis Bocha on 23.07.2025.
//

import XCTest

final class RegisterPageTests: XCTestCase {
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
        loginPage
            .tapRegisterButton()
        
    }
    
    func testAllElemetRegisterPageDisplayed(){
        
        registerPage
            .displayedRegisterTitle()
            .displayEmailField()
            .displayPasswordField()
            .displayAgeField()
            .displayRegisterButton()
            .displayBackButton()
    }
    
    func testPlaceholdersRegisterPage(){
        
        registerPage
            .placeHolderEmail()
            .placeHolderPassword()
            .placeHolderAge()    }
    
    func testRegisterEmptyAllField(){
        registerPage
            .registerButtonIsNotEnable()
    }
    
    func testRegisterEmptyPasswordAndAge(){
        let email = "adizen@ya.ru"
        registerPage
            .inputEmail(email)
            .registerButtonIsNotEnable()
    }
    
    func testRegisterEmptyPassword(){
        let email = "adizen@ya.ru"
        let age = "25"
        registerPage
            .inputEmail(email)
            .inputAge(age)
            .registerButtonIsNotEnable()
    }
    
    func testIncorrectEmailForRegistr() throws {
        try XCTSkipIf(true, "Баг, полле ввода должно валидировать email, а регистрирует все подряд")
        let email = "11"
        let password = "123456"
        let age = "25"
        registerPage
            .inputEmail(email)
            .inputPassword(password)
            .inputAge(age)
            .registerButtonIsNotEnable()
    }
    
    func testIncorrectMinLenPassword() throws {
        try XCTSkipIf(true, "Баг, полле ввода пароля должно утсанавливать минимальную длину 6 символов")
        let email = "test@test123.ru"
        let password = "12345"
        let age = "25"
        registerPage
            .inputEmail(email)
            .inputPassword(password)
            .inputAge(age)
            .registerButtonIsNotEnable()
    }
    
    func testSucsessefulRegister() throws {
        try XCTSkipIf(true, "Чтобы не перегружать базу поставил этот тест в игноре, нужно подключить faker")
        let email = "test@yainshok.ru"
        let password = "123456"
        let age = "25"
        registerPage
            .inputEmail(email)
            .inputPassword(password)
            .inputAge(age)
            .tapRegisterButton()
        profilePage
            .displayedUserName()
            .tapLogoutButton()    }
    
    func testNavigationRegisterFromLogin(){
        registerPage
            .tapBackButton()
        loginPage
            .displayedScreenTitle()
    }
    
}
