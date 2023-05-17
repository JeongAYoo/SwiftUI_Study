//
//  Constants.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import Foundation

struct APIKey {
    static let ACCESS_TOKEN = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzIwZDA2ZGUyNzg5ZmQzZjAxZjRlMWQ5MjM2ZjFmMiIsInN1YiI6IjY0NjQ4YjMzZDA1YTAzMDE3MGMxYTk1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.r15QhqjDwFJqnIx5Mj_cnBftkWzjgxa5We3lB-TqwOs"
}

struct Endpoint {
    static let movieURL = "https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1&region=KR&sort_by=popularity.desc"
    static let posterURL = "https://image.tmdb.org/t/p/original"
}
