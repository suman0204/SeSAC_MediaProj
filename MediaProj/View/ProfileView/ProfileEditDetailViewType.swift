//
//  ProfileEditDetailViewType.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/29.
//

import Foundation

enum ProfileEditDetailViewType: CaseIterable {
    case name
    case userName
    case genderPronoun
    case introduce
    case link
    case gender
    
    var title: String {
        switch self {
        case .name:
            return "이름"
        case .userName:
            return "사용자 이름"
        case .genderPronoun:
            return "성별 대명사"
        case .introduce:
            return "소개"
        case .link:
            return "링크"
        case .gender:
            return "성별"
        }
    }
    

}
