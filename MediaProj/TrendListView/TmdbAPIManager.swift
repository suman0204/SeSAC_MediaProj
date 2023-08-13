//
//  TmdbAPIManager.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation
import Alamofire
import SwiftyJSON

class TrendingAPIManager {
    
    static let shared = TrendingAPIManager()
    
    private init() { }
    
    func callRequest(type: TimeWindow, resultData: @escaping ([Movie]) -> Void ) {
        let url = type.requestURL
        print(url)
        let header: HTTPHeaders = [
            "accept" : APIKey.tmdbAccept,
            "Authorization" : APIKey.tmdbAuthorization
        ]
        
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                var movieList: [Movie] = []
                
                for item in json["results"].arrayValue {
                    let id = item["id"].intValue
                    let title = item["title"].stringValue
                    let posterPath = item["poster_path"].stringValue
                    let backdropPath = item["backdrop_path"].stringValue
                    let genreIDs = item["genre_ids"].arrayValue[0].intValue
                    let releaseDate = item["release_date"].stringValue
                    let voteAvg = item["vote_average"].doubleValue
                    
                    movieList.append(Movie(id: id, title: title, posterPath: posterPath, backdropPath: backdropPath, genreIDs: genreIDs, releaseDate: releaseDate, voteAvg: voteAvg))
                }
                
                resultData(movieList)
                print("callrequest=======")
                print(movieList)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
