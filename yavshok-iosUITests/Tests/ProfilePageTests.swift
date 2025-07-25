
//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by Denis Bocha on 23.07.2025.
//

import XCTest

final class ProfilePageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPge = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    private lazy var editPage = EditPage(app: app)
    
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
            .inputEmail("adizen@ya.ru")
            .inputPassword("123456")
            .tapLoginButton()
        profilePage
            .displayedUserName()
        
    }
    
    func testAllElemetProfilePageDisplayed(){
        
        profilePage
            .displayedPhoto1()
            .displayedPhoto2()
            .displayedPhoto3()
            .displayedPhoto4()
            .displayedUserName()
            .displayedAgeLabel()
            .displayedEditProfileButton()
            .displayedLogoutButton()
            .displayedProfileImage()
            .tapLogoutButton()
    }
        
    func testNavigationToStartFromProfile(){
        profilePage
            .tapLogoutButton()
        mainPge
            .displaedTitle()
    }
    
    func testNavigationToEditFromProfile(){
        profilePage
            .tapEditButton()
        editPage
            .displayedTitleEditPage()
            .tapCancelButton()
        profilePage
            .tapLogoutButton()            
    }
}
