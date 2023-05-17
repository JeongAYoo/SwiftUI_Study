//
//  MovieViewModel.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import Foundation
import Alamofire
import SwiftyJSON

final class MovieViewModel: ObservableObject {
    @Published var movieData: [Movie] = []
    
    private let url = Endpoint.movieURL
    private let headers: HTTPHeaders = [
      "accept": "application/json",
      "Authorization": APIKey.ACCESS_TOKEN
    ]
            
    func fetchMovieData() {
        AF.request(url, method: .get, headers: headers).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for item in json["results"].arrayValue {
                    let data = Movie(id: item["id"].intValue,
                                     title: item["title"].stringValue, release_date: item["release_date"].stringValue,
                                     poster_path: item["poster_path"].stringValue,
                                     vote_average: item["vote_average"].doubleValue)
                    self.movieData.append(data)
                }
                
            case .failure(let error):
                self.movieData = []
                print(error)
            }
        }
    }
}
