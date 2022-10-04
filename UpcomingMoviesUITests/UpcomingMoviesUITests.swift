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
//        let exp2 = XCTestExpectation(description: "Vote is shown")
//        exp2.fulfill()
//        wait(for: [exp2], timeout: 3)
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

        // MARK: Button NSPredicate
        let backBtn1 = app.navigationBars.buttons.matching(NSPredicate(format: "label CONTAINS %@ AND label CONTAINS %@", "Upcoming", "movies")).firstMatch
        //print("Debug backBtn1: \(backBtn1.debugDescription)")
        print("backBtn1: title=== \(backBtn1.title), label1=== \(backBtn1.label), identifier1===\(backBtn1.identifier), type1===\(backBtn1.elementType)")

        // MARK: backBtn element
        let backBtn = app.navigationBars.buttons["Upcoming movies"]
        print("Debug backBtn: \(backBtn.debugDescription)")
        print("backBtn: title=== \(backBtn.title), label=== \(backBtn.label), identifier===\(backBtn.identifier), type===\(backBtn.elementType)")

        // MARK: elipsBtn element
        let elipsBtn = app.navigationBars.buttons["Ellipsis"]
        print("elipsBtn: title=== \(elipsBtn.title), label=== \(elipsBtn.label), identifier===\(elipsBtn.identifier), type===\(elipsBtn.elementType)")
        print("label=== \(elipsBtn.label)")

        // MARK: reviewLabel
        //let reviewLabel = app.otherElements["Reviews"]
        let reviewLabel = app.scrollViews.otherElements["Reviews"]
        print("reviewLabel: title=== \(reviewLabel.title), label=== \(reviewLabel.label), identifier===\(reviewLabel.identifier), type===\(reviewLabel.elementType)")
        //print("reviewLabel: \(reviewLabel.exists), \(type(of: reviewLabel))")
        reviewLabel.tap()

        // MARK: movieDetailLabel

        let titleLabel = app.staticTexts.containing(NSPredicate(format: "identifier LIKE %@", "\(Accessibility.MovieDetailView.titleLabel.identifier)*")).element
        //print("Debug backBtn1: \(backBtn1.debugDescription)")
        print("titleLabel: title=== \(titleLabel.title), label=== \(titleLabel.label), identifier===\(titleLabel.identifier), type===\(titleLabel.elementType)")

    }

    func testWithAccessibilityIDsEnum () {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.cells["Spider-Man: No Way Home"].tap()
        sleep(3)

        // MARK: overviewLabel
        let overviewLabel = app.staticTexts[Accessibility.MovieDetailView.overviewLabel.identifier]

        print("overviewLabel: title=== \(overviewLabel.title), label=== \(overviewLabel.label), identifier===\(overviewLabel.identifier), type===\(overviewLabel.elementType)")
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
