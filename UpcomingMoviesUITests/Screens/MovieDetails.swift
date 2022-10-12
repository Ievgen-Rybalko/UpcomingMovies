//
//  MovieDetails.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 11.10.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation
import XCTest

class MovieDetail {
    let app: XCUIApplication
    let titleLabel: XCUIElement
    let voteAverageLabel: XCUIElement
    let overviewLabel: XCUIElement
    let reviewLabel: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        titleLabel = app.staticTexts.containing(NSPredicate(format: "identifier LIKE %@", "\(Accessibility.MovieDetailView.titleLabel.identifier)*")).element
        voteAverageLabel = app.scrollViews.staticTexts[Accessibility.MovieDetailView.voteAverageLabel.identifier]
        overviewLabel = app.windows.scrollViews.staticTexts[Accessibility.MovieDetailView.overviewLabel.identifier]
        reviewLabel = app.scrollViews.otherElements["Reviews"]
    }

}

extension XCUIElement {
    var textExtruction: String {
        guard self.exists else {
            XCTFail("No element to take the text")
            return "test failed"
        }
        return self.label
    }
}
