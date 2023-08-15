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
        
        configureCell()
    }


    func configureCell(row: Movie) {
        releaseDate.text = row.releaseDate
        genre.text = "#\(row.genreText)"
        
        thumbnailImage.kf.setImage(with: URL(string: row.backdropURL))
        
        rateValueLabel.text = row.voteAvgToText
        
        titleLabel.text = row.title
        
        
       
    }
    
}

extension TrendListTableViewCell {
    func configureCell() {
        
        releaseDate.font = .boldSystemFont(ofSize: 13)
        releaseDate.textColor = .systemGray
        
        genre.font = .boldSystemFont(ofSize: 17)
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)
        let image = UIImage(systemName: "paperclip", withConfiguration: imageConfig)
        copyLinkButton.setImage(image, for: .normal)
//        copyLinkButton.imageEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
        copyLinkButton.setTitle("", for: .normal)
        copyLinkButton.tintColor = .black
        copyLinkButton.backgroundColor = .white
        copyLinkButton.layer.cornerRadius = 17.5
        
        rateTitleLabel.text = "평점"
        rateTitleLabel.textAlignment = .center
        rateTitleLabel.font = .systemFont(ofSize: 13)
        rateTitleLabel.textColor = .white
        rateTitleLabel.backgroundColor = .systemIndigo
        
        rateValueLabel.textAlignment = .center
        rateValueLabel.font = .systemFont(ofSize: 13)
        rateValueLabel.textColor = .black
        rateValueLabel.backgroundColor = .white
        
        thumbnailImage.contentMode = .scaleAspectFill
        thumbnailImage.layer.cornerRadius = 10
        thumbnailImage.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        cardBackView.layer.cornerRadius = 10
        cardBackView.layer.borderColor = UIColor.clear.cgColor
        cardBackView.layer.borderWidth = 1
        cardBackView.layer.shadowOpacity = 0.4
        cardBackView.layer.shadowRadius = 7
        cardBackView.layer.masksToBounds = false
        
        titleLabel.font = .systemFont(ofSize: 20)
        
        actorsLabel.font = .systemFont(ofSize: 13)
        actorsLabel.textColor = .gray
        
        goToDetailLabel.text = "자세히 보기"
        goToDetailLabel.font = .systemFont(ofSize: 13)
        
        arrowImage.image = UIImage(systemName: "chevron.right")
        arrowImage.tintColor = .black
        
        
        
    }
}
