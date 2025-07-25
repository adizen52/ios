//
//  EditPage.swift
//  yavshok-ios
//
//  Created by Denis Bocha on 24.07.2025.
//

import XCTest

final class EditPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var titleEditPage: XCUIElement {
        return app.staticTexts["Редактировать профиль"].firstMatch
    }
    
    private var nameLine: XCUIElement {
        return app.staticTexts["Имя"].firstMatch
    }
    
    private var nameField: XCUIElement {
        return app.textFields["nameField"].firstMatch
    }
    
    private var buttonSave:XCUIElement {
        return app.buttons["saveButton"].firstMatch
    }
    
    private var cancelButton: XCUIElement {
        return app.buttons["cancelButton"].firstMatch
    }
    
    private var errorEdit: XCUIElement {
        return app.staticTexts["Ошибка"].firstMatch
    }
    
    private var errorLenName: XCUIElement {
        return app.staticTexts["Имя должно быть 50 символов или меньше"].firstMatch
    }
    
    private var buttonOk: XCUIElement {
        return app.buttons["OK"].firstMatch
    }
    
    @discardableResult
    func displayedTitleEditPage() -> Self{
        XCTAssert(titleEditPage.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedNameLine() -> Self{
        XCTAssert(nameLine.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedNameField() -> Self{
        XCTAssert(nameField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedSaveButton() -> Self{
        XCTAssert(buttonSave.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedErrorEdit() -> Self{
        XCTAssert(errorEdit.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedErrorLenName() -> Self{
        XCTAssert(errorLenName.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedButtonOk() -> Self{
        XCTAssert(buttonOk.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedCancelButton() -> Self{
        XCTAssert(cancelButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func inputName(_ name: String) -> Self{
        nameField.typeText(name)
        XCTAssert(nameField.value.debugDescription.contains(name))
        return self
    }
    
    @discardableResult
    func tapSaveButton() -> Self{
        displayedSaveButton()
        buttonSave.tap()
        return self
    }
    
    @discardableResult
    func tapCancelButton() -> Self{
        displayedCancelButton()
        cancelButton.tap()
        return self
    }
    
    @discardableResult
    func tapButtonOk() -> Self{
        displayedButtonOk()
        buttonOk.tap()
        return self
    }
    
    @discardableResult
    func clearName(app: XCUIApplication) -> Self {
        displayedNameField()
        nameField.doubleTap()
        return self
    }
    
}
