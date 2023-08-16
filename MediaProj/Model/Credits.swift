//
//  Credits.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/15.
//

import Foundation

// MARK: - Credits
struct Credits: Codable {
    let id: Int
    let cast, crew: [Cast]
    
    var castNameList: String {
        
        var result: String = ""
        for index in 0...5 {
            result += cast[index].name
        }
        return result
    }
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment: Department
    let name, originalName: String
    let popularity: Double
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String
    let order: Int?
    let department: Department?
    let job: String?
    
    var profileURL: String {
        return "https://image.tmdb.org/t/p/original\(profilePath)"
    }


    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
