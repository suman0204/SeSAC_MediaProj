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
    
    func callRequest(type: TimeWindow, resultData: @escaping (TrendingMovie) -> Void ) {
        let url = type.requestURL
        print(url)
        let header: HTTPHeaders = APIKey.header
        
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: TrendingMovie.self) { response in
            print(response.value?.results)
//            print(type(of: response.value))
            
            if let result = response.value {
                resultData(result)
            } else {
                print("no result data")
            }
        }
    }

    func callCreditsRequest(id: String, resultData: @escaping (Credits) -> Void ) {
        let url = URL.makeCreditsURL(id)
        let header = APIKey.header
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: Credits.self) { response in
            print(url)
            print(response.value)
        }

    }
}
