//
//  ProfileEditDetailView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/30.
//

import UIKit

class ProfileEditDetailView: BaseView {
    let titleLabel = {
        let view = UILabel()
        view.textColor = .systemGray
        view.font = .systemFont(ofSize: 13)
        return view
    }()
    
    let inputTextField = {
        let view = UITextField()
        view.textColor = .white
        return view
    }()
    
    
    override func configureView() {
        [titleLabel, inputTextField].forEach {
            addSubview($0)
        }
    }
    
    override func setConstrainst() {
        titleLabel.snp.makeConstraints { make in
            print("detailTitleLabel")
            make.leading.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            
            
        }
        
        inputTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
}
