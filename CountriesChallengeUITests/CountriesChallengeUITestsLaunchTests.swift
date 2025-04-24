//
//  CountriesChallengeUITestsLaunchTests.swift
//  CountriesChallengeUITests
//

import XCTest

class CountriesChallengeUITestsLaunchTests: BaseUITest {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        
        let usernameField = app.textFields["Username"]
            let passwordField = app.secureTextFields["Password"]
            let loginButton = app.buttons["Login"]

            XCTAssertTrue(usernameField.waitForExistence(timeout: 5), "Username field not found")
            XCTAssertTrue(passwordField.exists, "Password field not found")
            XCTAssertTrue(loginButton.exists, "Login button not found")

            usernameField.tap()
            usernameField.typeText("testuser")

            passwordField.tap()
            passwordField.typeText("password123")

            loginButton.tap()

            let homeLabel = app.staticTexts["Welcome"]
            XCTAssertTrue(homeLabel.waitForExistence(timeout: 5), "Did not navigate to home screen after login")

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
