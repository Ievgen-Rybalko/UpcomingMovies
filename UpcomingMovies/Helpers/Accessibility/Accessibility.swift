//
//  Accessibility.swift
//  UpcomingMovies
//
//  Created by Ievgen Rybalko on 27.09.2022.
//  Copyright © 2022 Alonso. All rights reserved.
//

import Foundation

struct Accessibility {}

// MARK: - MovieDetailView

extension Accessibility {
    enum MovieDetailView: String {
        case backdropImageView//
        case voteAverageLabel
        case voteAverageView//
        case posterImageView//
        case releaseDateLabel//
        case genreLabel//
        case titleLabel //
        case overviewLabel//

        var identifier: String {
            return rawValue
        }
    }
}
// MARK: - MovieCellsView

extension Accessibility {
    enum MovieCell: String {
        case movieCell

        var identifier: String {
            return rawValue
        }
    }
}
