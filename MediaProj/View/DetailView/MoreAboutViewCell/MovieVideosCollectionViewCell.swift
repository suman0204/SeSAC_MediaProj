//
//  MovieVideosCollectionViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/21.
//

import UIKit

class MovieVideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet var movieVideoLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        movieVideoLink.text = nil
    }

}
