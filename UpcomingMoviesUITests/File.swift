//
//  File.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 07.10.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation
import XCTest
class UpcomingMoviesUITests1: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface
        //orientation - required for your tests before they run. The setUp method
        //is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWithScroll () {
        let app = XCUIApplication()
        app.launch()
        let app1 = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        app1.launch()
        print("safffari \(app1.debugDescription)")

        sleep(3)

        let textField = app1.textFields.firstMatch
        textField.swipeLeft()
        print("===searchField:: title=== \(textField.title), label=== \(textField.label)")
        print("identifier===\(textField.identifier), type===\(textField.elementType), placeholder\(textField.placeholderValue)")

        sleep(2)
        textField.tap()
        textField.typeText("www.ukr.net\n")
        Thread.sleep(forTimeInterval: 3)

        print("===appsss STATE:: \(app.state)")
        print("===debugDescription:: \(app1.debugDescription)")

//        let cellA = app.cells.element(boundBy: 3)
//        print("cellA: title== \(cellA.title), label=== \(cellA.label), identifier==\(cellA.identifier), type==\(cellA.elementType)")
//        print("cellA XCUIElementType: \(type(of: cellA))")
//
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "My Awesome Screenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
