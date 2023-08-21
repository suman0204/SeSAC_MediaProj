//
//  TmdbAPIManager.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation
import Alamofire

class TrendingAPIManager {
    
    static let shared = TrendingAPIManager()
    
    private init() { }
    
    func callRequest(type: TimeWindow, success: @escaping (TrendingMovie) -> Void, failure: @escaping () -> Void ) {
        let url = type.requestURL
        print(url)
        let header: HTTPHeaders = APIKey.header
        
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseDecodable(of: TrendingMovie.self) { response in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }

    func callCreditsRequest(id: String, success: @escaping (Credits) -> Void, failure: @escaping () -> Void ) {
        let url = URL.makeCreditsURL(id)
        let header = APIKey.header
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: Credits.self) { response in
            print(url)
            
            switch response.result {
            case.success(let value):
                success(value)
            case .failure(let error):
                print("CreditsError")
                print(error)
                failure()
            }

        }

    }
    
    func callSimilarMovieRequest(id: String, success: @escaping (SimilarMovie) -> Void, failure: @escaping () -> Void ) {
        let url = URL.makeSimilarMovieURL(id)
        print(url)
        let header = APIKey.header
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: SimilarMovie.self) { reponse in
            switch reponse.result {
            case.success(let value):
                print(value)
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }
    
    func callMovieVideosRequest(id: String, success: @escaping (MovieVideos) -> Void, failure: @escaping () -> Void ) {
        let url = URL.makeMoiveVideosURL(id)
        
//    https://api.themoviedb.org/3/movie/{movie_id}/videos
//    https://api.themoviedb.org/3/movie/{movie_id}/similar
        print(url)
        let header = APIKey.header
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: MovieVideos.self) { reponse in
            switch reponse.result {
            case.success(let value):
                print(value)
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }
}
