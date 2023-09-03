//
//  TrendListTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import UIKit
import Kingfisher

class TrendListTableViewCell: BaseTableViewCell {
//    @IBOutlet var releaseDate: UILabel!
//    @IBOutlet var genre: UILabel!
    
//    @IBOutlet var cardBackView: UIView!
//    @IBOutlet var thumbnailImage: UIImageView!
//    @IBOutlet var copyLinkButton: UIButton!
//    @IBOutlet var rateTitleLabel: UILabel!
//    @IBOutlet var rateValueLabel: UILabel!
    
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var originalTitleLabel: UILabel!
//    @IBOutlet var actorsLabel: UILabel!
//    @IBOutlet var goToDetailLabel: UILabel!
//    @IBOutlet var arrowImage: UIImageView!
    
//    @IBOutlet var divider: UIView!
    
    
    let releaseDate = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 13)
        view.textColor = .systemGray
        return view
    }()
    
    let genre = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        return view
    }()
    
    let cardBackView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.borderWidth = 1
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 7
        view.layer.masksToBounds = false
        return view
    }()
    
    let thumbnailImage = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        return view
    }()
    
    let copyLinkButton = {
       let view = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)
        let image = UIImage(systemName: "paperclip", withConfiguration: imageConfig)
        view.setImage(image, for: .normal)
        view.setTitle("", for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 17.5
        return view
    }()
    
    let rateTitleLabel = {
        let view = UILabel()
        view.text = "평점"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 13)
        view.textColor = .white
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    let rateValueLabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 13)
        view.textColor = .black
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let originalTitleLabel = {
       let view = UILabel()
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    let actorsLabel = {
       let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textColor = .gray
        return view
    }()
    
    let goToDetailLabel = {
        let view = UILabel()
        view.text = "자세히 보기"
        view.font = .systemFont(ofSize: 13)
        return view
    }()
    
    let arrowImage = {
       let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .black
        return view
    }()
    
    let divider = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
////        configureCellDesign()
//    }

    //TrendingAllView에서 사용될 함수
    func configureCellTrednAllData(row: TrendAllResult) {
        releaseDate.text = row.releaseDate
        genre.text = "#\(row.genreText)"
        
        thumbnailImage.kf.setImage(with: URL(string: row.backdropURL))
        
        
        rateValueLabel.text = row.voteAvgToText
        
        titleLabel.text = row.title
        
        originalTitleLabel.text = "(\(row.originalTitle))"
        
        actorsLabel.text = "castNames"

    }
    
    func configureCellData(row: Movie) {
        releaseDate.text = row.releaseDate
        genre.text = "#\(row.genreText)"
        
        thumbnailImage.kf.setImage(with: URL(string: row.backdropURL))
        
        
        rateValueLabel.text = row.voteAvgToText
        
        titleLabel.text = row.title
        
        originalTitleLabel.text = "(\(row.originalTitle))"
        
        actorsLabel.text = "castNames"

    }
    
    override func configureView() {
        [releaseDate, genre, cardBackView, thumbnailImage, copyLinkButton, rateTitleLabel, rateValueLabel, titleLabel, originalTitleLabel, actorsLabel, goToDetailLabel, arrowImage, divider].forEach {
            contentView.addSubview($0)
            print("configureCell")
        }
    }
    
    override func setConstraints() {
        releaseDate.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
        }
        
        genre.snp.makeConstraints { make in
            make.top.equalTo(releaseDate).offset(5)
        }
        
        cardBackView.snp.makeConstraints { make in
            make.top.equalTo(genre).offset(15)
            make.horizontalEdges.bottom.equalToSuperview().inset(15)
        }
        
        thumbnailImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(cardBackView)
            make.height.equalToSuperview().multipliedBy(0.66)
        }
    }
}

extension TrendListTableViewCell {
    func configureCellDesign() {
        
//        releaseDate.font = .boldSystemFont(ofSize: 13)
//        releaseDate.textColor = .systemGray
//
//        genre.font = .boldSystemFont(ofSize: 17)
        
//        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)
//        let image = UIImage(systemName: "paperclip", withConfiguration: imageConfig)
//        copyLinkButton.setImage(image, for: .normal)
////        copyLinkButton.imageEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
//        copyLinkButton.setTitle("", for: .normal)
//        copyLinkButton.tintColor = .black
//        copyLinkButton.backgroundColor = .white
//        copyLinkButton.layer.cornerRadius = 17.5
        
//        rateTitleLabel.text = "평점"
//        rateTitleLabel.textAlignment = .center
//        rateTitleLabel.font = .systemFont(ofSize: 13)
//        rateTitleLabel.textColor = .white
//        rateTitleLabel.backgroundColor = .systemIndigo
        
//        rateValueLabel.textAlignment = .center
//        rateValueLabel.font = .systemFont(ofSize: 13)
//        rateValueLabel.textColor = .black
//        rateValueLabel.backgroundColor = .white
        
//        thumbnailImage.contentMode = .scaleAspectFill
//        thumbnailImage.layer.cornerRadius = 10
//        thumbnailImage.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
//        cardBackView.layer.cornerRadius = 10
//        cardBackView.layer.borderColor = UIColor.clear.cgColor
//        cardBackView.layer.borderWidth = 1
//        cardBackView.layer.shadowOpacity = 0.4
//        cardBackView.layer.shadowRadius = 7
//        cardBackView.layer.masksToBounds = false
        
//        titleLabel.font = .systemFont(ofSize: 20)
        
//        originalTitleLabel.font = .systemFont(ofSize: 18)
        
//        actorsLabel.font = .systemFont(ofSize: 13)
//        actorsLabel.textColor = .gray
        
//        goToDetailLabel.text = "자세히 보기"
//        goToDetailLabel.font = .systemFont(ofSize: 13)
        
//        arrowImage.image = UIImage(systemName: "chevron.right")
//        arrowImage.tintColor = .black

        
        
    }
}
