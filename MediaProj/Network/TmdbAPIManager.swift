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
    
    
    //Trendig/All/Day API URLSession으로 불러오기
    func callTrendingAllDayRequest(completionHandler: @escaping (TrendingAll?) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/day") else { return }
        
        var request = URLRequest(url: url) // Default: GET
    
        //header 등록
        request.addValue(APIKey.tmdbAccept, forHTTPHeaderField: "accept")
        request.addValue(APIKey.tmdbAuthorization, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(nil)
                    print(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                    print(error)
                    completionHandler(nil)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(TrendingAll.self, from: data)
                    completionHandler(result)
                    print(result)
                } catch {
                    print(error)
                }
            }
            
        }.resume()
        
    }
    
}
