//
//  UpcomingMoviesUITests.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 20.07.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import XCTest

class UpcomingMoviesUITests: XCTestCase {

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

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        print("app.debugDescription: \(app.debugDescription)")
        app.tabBars.buttons["Search"].tap()
        app.navigationBars.searchFields["Search"].tap()
        let exp1 = XCTestExpectation(description: "Wait for movie is found")
        app.navigationBars.searchFields["Search"].typeText("Memory\n")
        print("UIElement.ElementType.rawValue: \(app.navigationBars.searchFields["Search"].elementType.rawValue)")
        //app.navigationBars.searchFields["Search"].typeText("Memory")
        //app.buttons["search"].tap()
        exp1.fulfill()
        wait(for: [exp1], timeout: 3)
        XCTAssertNotNil((app.staticTexts["Memory"]))
        //XCTAssert(app.staticTexts["Memory"].waitForExistence(timeout: 10))
        // Use XCTAssert and related functions to verify your tests produce the
        // correct results.
    }

    func testCastExists() {
        let app = XCUIApplication()
        app.launch()
        print("app.collectionViews.cells: \(app.collectionViews.cells.debugDescription)")
        app.collectionViews.cells["Spider-Man: No Way Home"].tap()
        let exp2 = XCTestExpectation(description: "Vote is shown")
        exp2.fulfill()
        wait(for: [exp2], timeout: 3)
        //print("app.debugDescription in \(#function): \(app.debugDescription)")
        let titleLabel = app.staticTexts["titleLabel"]
        let titleText = titleLabel.label
        print("titleText: \(titleText)")
        let voteElem = app.staticTexts["voteAverageLabel"]
        let voteText = voteElem.label
        print("voteElem: \(voteElem), voteText = \(voteText)")
        XCTAssertEqual(titleText, "Spider-Man: No Way Home")
        //let textInLabel = app.staticTexts["'Credits'"].label
        XCTAssertTrue(voteText == "8.0")
        //XCUIApplication().collectionViews.cells["Fall"].children(matching: .other).element.tap()
    }
    
    func testReviwLabelExists () {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.cells["Spider-Man: No Way Home"].tap()
//        let exp1 = XCTestExpectation(description: "Vote is shown")
        
//        exp1.fulfill()
//        wait(for: [exp1], timeout: 3)
        sleep(3)
        let reviewLabel = app.otherElements["Reviews"]
//        let exp2 = XCTestExpectation(description: "Vote is shown")
//        exp2.fulfill()
//        wait(for: [exp2], timeout: 3)
        print("reviewLabel: \(reviewLabel.exists), \(type(of: reviewLabel))")
        reviewLabel.tap()
        sleep(3)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
