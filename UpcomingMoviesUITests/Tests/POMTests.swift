//
//  POMTests.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 11.10.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import XCTest
class POMTests: XCTestCase {

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

    func testVoleLabel() {
        let app = XCUIApplication()
        app.launch()

        let mainPage = MoviesMainPage(app: app)
        mainPage.tapToMovie(name: "Fall")

        Thread.sleep(forTimeInterval: 3)
        let movieDetail = MovieDetail(app: app)
        let voteLabelText = movieDetail.voteAverageLabel.textExtruction
        XCTAssertEqual(voteLabelText, "7.4")

    }

    func testOverviewLabel() {
        let app = XCUIApplication()
        app.launch()

        let mainPage = MoviesMainPage(app: app)
        mainPage.tapToMovie(name: "Fall")

        Thread.sleep(forTimeInterval: 3)
        let movieDetail = MovieDetail(app: app)
        let overviewLabelText = movieDetail.overviewLabel.textExtruction
        XCTAssertGreaterThan(overviewLabelText.count, 100)

    }

    func testTitleLabel() {
        let app = XCUIApplication()
        app.launch()

        let mainPage = MoviesMainPage(app: app)
        mainPage.tapToMovie(name: "Fall")

        Thread.sleep(forTimeInterval: 3)
        let movieDetail = MovieDetail(app: app)
        let titleLabelText = movieDetail.titleLabel.textExtruction
        XCTAssertEqual(titleLabelText, "Fall")
    }

}
