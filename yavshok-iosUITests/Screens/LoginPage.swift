//
//  LoginPage.swift
//  yavshok-ios
//
//  Created by Denis Bocha on 24.07.2025.
//

import XCTest

final class LoginPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["loginTitle"].firstMatch
    }
    
    private var emailField: XCUIElement {
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement {
        return app.secureTextFields["passwordField"].firstMatch
    }
    
    
    private var loginButton: XCUIElement {
        return app.buttons["loginButton"].firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.buttons["backButton"].firstMatch
    }
    
    private var registerButton: XCUIElement {
        return app.buttons["registerButton"].firstMatch
    }
    
    private var validationError: XCUIElement {
        return app.staticTexts["validationError"].firstMatch
    }
    
    private var placeholderEmail = "Email"
    
    private var placeholderPassword = "Пароль"
    
    @discardableResult
    func displayedScreenTitle() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedEmailField() -> Self {
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedPasswordField() -> Self {
        XCTAssert(passwordField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedLoginButton() -> Self {
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedBackButton() -> Self {
        XCTAssert(backButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedRegisterButton() -> Self {
        XCTAssert(registerButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedValidationError() -> Self {
        XCTAssert(validationError.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func inputEmail(_ email: String) -> Self {
        displayedEmailField()
        emailField.tap()
        emailField.typeText(email)
        XCTAssert(emailField.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func inputPassword(_ password: String) -> Self {
        displayedPasswordField()
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        displayedLoginButton()
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self {
        displayedBackButton()
        backButton.tap()
        return self
    }
    
    @discardableResult
    func tapRegisterButton() -> Self {
        displayedRegisterButton()
        registerButton.tap()
        return self
    }
    
    @discardableResult
    func placeholderEmailText() -> Self {
        XCTAssert(emailField.placeholderValue == placeholderEmail)
        return self
    }
    
    @discardableResult
    func placeholderPasswordText() -> Self {
        XCTAssert(passwordField.placeholderValue == placeholderPassword)
        return self
    }
    
    @discardableResult
    func buttonLoginIsNotEnable() -> Self {
        XCTAssert(!loginButton.isEnabled)
        return self
    }
}
