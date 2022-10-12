//
//  SignInWithTMDB.swift
//  UpcomingMoviesUITests
//
//  Created by Ievgen Rybalko on 12.10.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation
import XCTest

class SignInWithTMDB {
    let app: XCUIApplication
    let signInButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        signInButton = app.windows.buttons["Sign in with TheMovieDB"]

    }
}
