//
//  TrendListTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import UIKit
import Kingfisher

class TrendListTableViewCell: UITableViewCell {
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var genre: UILabel!
    
    @IBOutlet var cardBackView: UIView!
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var copyLinkButton: UIButton!
    @IBOutlet var rateTitleLabel: UILabel!
    @IBOutlet var rateValueLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var goToDetailLabel: UILabel!
    @IBOutlet var arrowImage: UIImageView!
    
    @IBOutlet var divider: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        thumbnailImage.layer.cornerRadius = 10
        thumbnailImage.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        cardBackView.layer.cornerRadius = 10
        cardBackView.layer.borderColor = UIColor.clear.cgColor
        cardBackView.layer.borderWidth = 1
//        cardBackView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cardBackView.layer.shadowOpacity = 0.4
        cardBackView.layer.shadowRadius = 8
        cardBackView.layer.masksToBounds = false
    }


    func configureCell(row: Movie) {
        releaseDate.text = row.releaseDate
        genre.text = "#\(row.genreIDs)"
        
        thumbnailImage.kf.setImage(with: URL(string: row.backdropURL))
        
        rateTitleLabel.text = "평점"
        rateValueLabel.text = row.voteAvgToText
        
        titleLabel.text = row.title
        
        goToDetailLabel.text = "자세히 보기"
        arrowImage.image = UIImage(systemName: "chevron.right")
    }
    
}
