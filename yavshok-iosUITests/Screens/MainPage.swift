//
//  MainPage.swift
//  yavshok-ios
//
//  Created by Denis Bocha on 24.07.2025.
//
import XCTest

final class MainPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["mainTitle"].firstMatch
    }
    
    private var emailInput: XCUIElement {
        return app.textFields["emailInput"].firstMatch
    }
    
    private var checkButton: XCUIElement {
        return app.buttons["checkButton"].firstMatch
    }
    
    private var loginButton: XCUIElement {
        return app.buttons["navigationButton"].firstMatch
    }
    
    private var staticTextEmailFalse: XCUIElement {
        return app.staticTexts["failureText"].firstMatch
    }
    
    private var failureEmailInput:XCUIElement {
        return app.textFields["failureEmailInput"].firstMatch
    }
    
    private var failureRecheckButton:XCUIElement {
        return app.buttons["failureRecheckButton"].firstMatch
    }
    
    private var failureNavigationButton:XCUIElement {
        return app.buttons["failureNavigationButton"].firstMatch
    }
    
    private var successEmailInput:XCUIElement {
        return app.textFields["successEmailInput"].firstMatch
    }
    
    private var successText:XCUIElement {
        return app.staticTexts["successText"].firstMatch
    }
    
    private var recheckButton:XCUIElement {
        return app.buttons["recheckButton"].firstMatch
    }
    
    private var successNavigationButton:XCUIElement {
        return app.buttons["successNavigationButton"].firstMatch
    }
    
    private var placeholderEmailText: String = "Email"
    
    @discardableResult
    func displaedTitle() -> Self{
        XCTAssert(screenTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedEmailInput() -> Self{
        XCTAssert(emailInput.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedCheckButton() -> Self{
        XCTAssert(checkButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedLoginButton() -> Self{
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedStaticTextEmailFalse() -> Self{
        XCTAssert(staticTextEmailFalse.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedFailureEmailInput() -> Self{
        XCTAssert(failureEmailInput.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedFailureRecheckButton() -> Self{
        XCTAssert(failureRecheckButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedFailureNavigationButton() -> Self{
        XCTAssert(failureNavigationButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedSuccessEmailInput() -> Self{
        XCTAssert(successEmailInput.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedSuccessText() -> Self{
        XCTAssert(successText.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedRecheckButton() -> Self{
        XCTAssert(recheckButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displaedSuccessNavigationButton() -> Self{
        XCTAssert(successNavigationButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkEmail(_ email: String) -> Self {
        emailInput.tap()
        emailInput.typeText(email)
        XCTAssert(emailInput.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func tapCheckButton() -> Self {
        displaedCheckButton()
        checkButton.tap()
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        displaedLoginButton()
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapRecheckButton() -> Self {
        displaedRecheckButton()
        recheckButton.tap()
        return self
    }
    
    @discardableResult
    func tapSuccessNavigationButton() -> Self {
        displaedSuccessNavigationButton()
        successNavigationButton.tap()
        return self
    }
    
    @discardableResult
    func tapFailureNavigationButton() -> Self {
        displaedFailureNavigationButton()
        failureNavigationButton.tap()
        return self
    }
    
    @discardableResult
    func tapFailureRecheckButton() -> Self {
        displaedFailureRecheckButton()
        failureRecheckButton.tap()
        return self
    }
    
    @discardableResult
    func inputFailureEmailInput(email: String) -> Self {
        displaedFailureEmailInput()
        failureEmailInput.tap()
        failureEmailInput.typeText(email)
        XCTAssert(failureEmailInput.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func inputSuccessEmailInput(email: String) -> Self {
        displaedSuccessEmailInput()
        successEmailInput.tap()
        successEmailInput.typeText(email)
        XCTAssert(successEmailInput.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func placeholderEmailInput() -> Self {
        displaedEmailInput()
        XCTAssert(emailInput.placeholderValue == placeholderEmailText)
        return self
    }
    
    @discardableResult
    func closeKeyboard(app: XCUIApplication) -> Self {
        app.keyboards.buttons["Return"].tap()
        return self
    }
    
    @discardableResult
    func clearEmailInput(app: XCUIApplication) -> Self {
        displaedEmailInput()
        emailInput.doubleTap()
        app.keys["delete"].tap()
        return self
    }
    
    @discardableResult
    func clearFailureEmailInput(app: XCUIApplication) -> Self {
        displaedFailureEmailInput()
        failureEmailInput.doubleTap()
        app.keys["delete"].tap()
        return self
    }
    
    @discardableResult
    func clearSuccessEmailInput(app: XCUIApplication) -> Self {
        displaedSuccessEmailInput()
        successEmailInput.doubleTap()
        app.keys["delete"].tap()
        return self
    }
    
    @discardableResult
    func checkButtonNotEnable() -> Self {
        XCTAssert(!checkButton.isEnabled)
        return self
    }
    
}
