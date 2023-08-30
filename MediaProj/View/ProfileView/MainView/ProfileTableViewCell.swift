//
//  ProfileTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/30.
//

import UIKit

class ProfileTableViewCell: BaseTableViewCell {
    
    var cellType: ProfileEditDetailViewType = .name
    
    
    let titleLabel = {
        let view = WhiteLabel()
        return view
    }()
    
    let contentLabel = {
        let view = GrayLabel()
        return view
    }()
    
    let blueLabel = {
        let view = BlueLabel()
        return view
    }()
    
    override func configureView() {
        
        contentView.backgroundColor = .black
        
        [titleLabel, contentLabel, blueLabel].forEach {
            contentView.addSubview($0)
        }
        

    }
    
    override func setConstraints() {
        super.setConstraints()
        print("PrintCellType",cellType)
        
        titleLabel.snp.makeConstraints { make in
            print("titleLabel")
            make.leading.verticalEdges.equalToSuperview().inset(10)
            make.width.equalTo(80)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    func blueLabelSetConstraints() {
        
        blueLabel.snp.makeConstraints { make in
            print("BlueLabel")
            make.leading.verticalEdges.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().offset(-10)
            
        }
        
    }
}
