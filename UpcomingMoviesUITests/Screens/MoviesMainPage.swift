//
//  MoviesMainPage.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 11.10.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation
import XCTest

class MoviesMainPage {
    let app: XCUIApplication
    var movieCell: XCUIElement
    let searchButton: XCUIElement
    let accountButton: XCUIElement
    let upcomingButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        movieCell = app.collectionViews.cells["Spider-Man: No Way Home"]
        searchButton = app.tabBars["Search"]
        accountButton = app.tabBars["Account"]
        upcomingButton = app.tabBars["Upcoming"]
        }

    func tapToMovie(name: String) {
        movieCell = app.collectionViews.cells[name]
        movieCell.tap()
    }

    func tapToAcc() {
        accountButton.tap()
    }

}

