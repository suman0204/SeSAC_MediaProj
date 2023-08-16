//
//  CastTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/16.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet var actorImage: UIImageView!
    @IBOutlet var actorNameLabel: UILabel!
    @IBOutlet var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actorImage.layer.cornerRadius = 10
        
        actorNameLabel.font = .boldSystemFont(ofSize: 15)
        actorNameLabel.textColor = .black
        
        characterNameLabel.font = .boldSystemFont(ofSize: 13)
        characterNameLabel.textColor = .systemGray
    }
    
    func configureCell(cast: Cast) {
        print("casttableview profileurl")
        print(cast.profileURL)
        actorImage.kf.setImage(with: URL(string: cast.profileURL))
    }
    
}
