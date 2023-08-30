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
    case changeToPro
    case privateInfo
    
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
        case .changeToPro:
            return "프로페셔널 계정으로 전환"
        case .privateInfo:
            return "개인 정보 설정"
        }
    }
    
    var placeholder: String {
        switch self {
        case .name:
            return "이름 입력"
        case .userName:
            return "사용자 이름 입력"
        case .genderPronoun:
            return "성별 대방사 추가"
        case .introduce:
            return "소개 입력"
        case .link:
            return "링크 추가"
        case .gender:
            return "성별 입력"
        case .changeToPro:
            return ""
        case .privateInfo:
            return ""
        }
    }
    

}
