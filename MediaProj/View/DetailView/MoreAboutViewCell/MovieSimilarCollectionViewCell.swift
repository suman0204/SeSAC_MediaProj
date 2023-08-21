//
//  MovieSimilarCollectionViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/21.
//

import UIKit

class MovieSimilarCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
    }
    
}
