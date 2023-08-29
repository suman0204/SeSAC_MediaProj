//
//  ProfileTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/30.
//

import UIKit

class ProfileTableViewCell: BaseTableViewCell {
    let titleLabel = {
       let view = WhiteLabel()
        return view
    }()
    
    let contentLabel = {
       let view = WhiteLabel()
        return view
    }()
    
    override func configureView() {
        contentView.backgroundColor = .black
        [titleLabel, contentLabel].forEach {
            contentView.addSubview($0)
        }
        titleLabel.backgroundColor = .yellow
        contentLabel.backgroundColor = .brown
    }
    
    override func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            print("yellotitle")
            make.leading.verticalEdges.equalToSuperview().inset(10)
            make.width.equalTo(80)
        }
        
        contentLabel.snp.makeConstraints { make in
            print("browcontent")
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalTo(titleLabel.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
