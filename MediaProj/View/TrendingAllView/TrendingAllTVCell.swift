//
//  TrendingAllTVCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/09/03.
//

import UIKit

class TrendingAllTVCell: BaseTableViewCell {
    let mediaTypeLabel = {
       let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 13)
        return view
    }()
    
    let titleLabel = {
       let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 17)
        return view
    }()
    
    let backDropImage = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    func configureCellData(row: TrendAllResult) {
        
        mediaTypeLabel.text = row.mediaType.rawValue
        
        titleLabel.text = row.title
        
        backDropImage.kf.setImage(with: URL(string: row.backdropURL))

    }
    
    override func configureView() {
        [mediaTypeLabel, titleLabel, backDropImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    override func setConstraints() {
        mediaTypeLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.height.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mediaTypeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(15)
        }
        
        backDropImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}
