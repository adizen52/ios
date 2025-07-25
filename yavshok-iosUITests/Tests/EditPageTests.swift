
import XCTest

final class EditPageTests: XCTestCase {
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
            .tapEditButton()
        editPage
            .displayedTitleEditPage()
        
    }
    
    func testAllElemetEditPageDisplayed(){
        
        editPage
            .displayedTitleEditPage()
            .displayedNameLine()
            .displayedNameField()
            .displayedSaveButton()
            .displayedCancelButton()
            .tapCancelButton()
        profilePage
            .tapLogoutButton()
    }
        
    func testNewName(){
        let names = ["Serg", "Сергей", "中文", "العربية"]
        
        for name in names {
            editPage
                .clearName(app: app)
                .inputName(name)
                .tapSaveButton()
            profilePage
                .editName(name: name)
                .tapEditButton()
        }
        editPage
            .clearName(app: app)
            .inputName("Serg")
            .tapSaveButton()
        profilePage
            .tapLogoutButton()
    }
    
    func testErrorBigLenNameEdit(){
        let name = "serg12345678901234567890123456789012345678901234567890"
        editPage
            .clearName(app: app)
            .inputName(name)
            .tapSaveButton()
            .displayedErrorEdit()
            .displayedErrorLenName()
            .tapButtonOk()
            .tapCancelButton()
        profilePage
            .tapLogoutButton()
            
    }
}
