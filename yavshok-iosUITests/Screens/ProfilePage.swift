//
//  ProfilePage.swift
//  yavshok-ios
//
//  Created by Denis Bocha on 24.07.2025.
//

import XCTest

final class ProfilePage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var profileImage: XCUIElement {
        return app.images["profileImage"].firstMatch
    }
    
    private var userName: XCUIElement {
        return app.staticTexts["userName"].firstMatch
    }
    
    private var ageLabel: XCUIElement {
        return app.staticTexts["ageLabel"].firstMatch
    }
    
    private var followersCount: XCUIElement {
        return app.staticTexts["followersCount"].firstMatch
    }
    
    private var likesCount: XCUIElement {
        return app.staticTexts["likesCount"].firstMatch
    }
    
    private var logoutButton: XCUIElement {
        return app.buttons["logoutButton"].firstMatch
    }
    
    private var editProfileButton: XCUIElement {
        return app.buttons["editProfileButton"].firstMatch
    }
    
    private var photo1: XCUIElement {
        return app.images["photo1"].firstMatch
    }
    
    private var photo2: XCUIElement {
        return app.images["photo2"].firstMatch
    }
    
    private var photo3: XCUIElement {
        return app.images["photo3"].firstMatch
    }
    
    private var photo4: XCUIElement {
        return app.images["photo4"].firstMatch
    }
    
    @discardableResult
    func displayedProfileImage() ->Self {
        XCTAssert(profileImage.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedUserName() ->Self {
        XCTAssert(userName.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedAgeLabel() ->Self {
        XCTAssert(ageLabel.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedFollowersCount() ->Self {
        XCTAssert(followersCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedLikesCount() ->Self {
        XCTAssert(likesCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedLogoutButton() ->Self {
        XCTAssert(logoutButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedEditProfileButton() ->Self {
        XCTAssert(editProfileButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedPhoto1() ->Self {
        XCTAssert(photo1.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedPhoto2() ->Self {
        XCTAssert(photo2.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedPhoto3() ->Self {
        XCTAssert(photo3.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func displayedPhoto4() ->Self {
        XCTAssert(photo4.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func logout() ->Self {
        displayedLogoutButton()
        logoutButton.tap()
        return self
    }
    
    @discardableResult
    func editProfile() ->Self {
        displayedEditProfileButton()
        editProfileButton.tap()
        return self
    }
    
    @discardableResult
    func tapLogoutButton() -> Self {
        displayedLogoutButton()
        logoutButton.tap()
        return self
    }
    
    @discardableResult
    func tapEditButton() -> Self {
        displayedEditProfileButton()
        editProfileButton.tap()
        return self
    }
    
    @discardableResult
    func editName(name: String) -> Self {
        XCTAssert(userName.label.contains(name))
        return self
    }
}
