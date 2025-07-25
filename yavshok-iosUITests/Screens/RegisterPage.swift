//
//  RegisterPage.swift
//  yavshok-ios
//
//  Created by Denis Bocha on 24.07.2025.
//

import XCTest

final class RegisterPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var registerTitle: XCUIElement{
        return app.staticTexts["registerTitle"].firstMatch
    }
    
    private var emailField: XCUIElement{
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement{
        return app.secureTextFields["passwordField"].firstMatch
    }
    
    private var ageField: XCUIElement{
        return app.textFields["ageField"].firstMatch
    }
    
    private var registerButton: XCUIElement{
        return app.buttons["registerButton"].firstMatch
    }
    
    private var backButton: XCUIElement{
        return app.buttons["backButton"].firstMatch
    }
    
    @discardableResult
    func displayedRegisterTitle() -> Self {
        XCTAssert(registerTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayEmailField() -> Self {
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayPasswordField() -> Self {
        XCTAssert(passwordField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayAgeField() -> Self {
        XCTAssert(ageField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayRegisterButton() -> Self {
        XCTAssert(registerButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayBackButton() -> Self {
        XCTAssert(backButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func inputEmail(_ email: String) -> Self {
        displayEmailField()
        emailField.tap()
        emailField.typeText(email)
        XCTAssert(emailField.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func inputPassword(_ password: String) -> Self {
        displayPasswordField()
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }
    
    @discardableResult
    func inputAge(_ age: String) -> Self {
        displayAgeField()
        ageField.tap()
        ageField.typeText(age)
        XCTAssert(ageField.value.debugDescription.contains(age))
        return self
    }
    
    @discardableResult
    func tapRegisterButton() -> Self {
        displayRegisterButton()
        registerButton.tap()
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self {
        displayBackButton()
        backButton.tap()
        return self
    }
    
    @discardableResult
    func placeHolderEmail() -> Self {
        XCTAssert(emailField.placeholderValue == "Введите email")
        return self
    }
    
    @discardableResult
    func placeHolderPassword() -> Self {
        XCTAssert(passwordField.placeholderValue == "Пароль")
        return self
    }
    
    @discardableResult
    func placeHolderAge() -> Self {
        XCTAssert(ageField.placeholderValue == "Возраст")
        return self
    }
    
    @discardableResult
    func registerButtonIsNotEnable() -> Self {
        XCTAssert(!registerButton.isEnabled)
        return self
    }
    
    
}
