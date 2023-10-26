//
//  Assugnment_N_15_TBC_AcademyUITestsLaunchTests.swift
//  Assugnment N 15 TBC AcademyUITests
//
//  Created by tornike <parunashvili on 25.10.23.
//

import XCTest

final class Assugnment_N_15_TBC_AcademyUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
