//
//  Accessibility.swift
//  UpcomingMovies
//
//  Created by Ievgen Rybalko on 27.09.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation

struct Accessibility {}

extension Accessibility {
    enum DetailView: String {
        case genreLabel
        case genre
        case releaseDate
    
    
        var idertifier: String {
            return rawValue
        }
    }
}

