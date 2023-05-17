//
//  Movie.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: Int
    var title: String
    var release_date: String
    var poster_path: String
    var vote_average: Double
}
