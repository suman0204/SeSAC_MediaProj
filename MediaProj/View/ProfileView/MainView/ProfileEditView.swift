//
//  ProfileView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class ProfileEditView: BaseView {
    
    let profileImage = {
        let view = CircleProfileImageView(frame: .zero)
        view.image = UIImage(systemName: "person")
        return view
    }()
    
    let avatarImage = {
        let view = CircleProfileImageView(frame: .zero)
        view.image = UIImage(systemName: "face.smiling")
        return view
    }()
    
    let profileImageStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 20
        return view
    }()
    
    let tableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        view.backgroundColor = .black
       return view
    }()
    
    override func configureView() {
    
        [profileImage, avatarImage].forEach {
            profileImageStackView.addArrangedSubview($0)
        }
        
        [profileImageStackView, tableView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstrainst() {
        profileImage.snp.makeConstraints { make in
            make.size.equalTo(80)
        }
        avatarImage.snp.makeConstraints { make in
            make.size.equalTo(80)
        }
        
        profileImageStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(100)
//            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profileImageStackView.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
            
        }
    }
    
}
