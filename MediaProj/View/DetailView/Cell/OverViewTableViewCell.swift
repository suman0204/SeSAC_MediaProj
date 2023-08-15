//
//  OverViewTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/16.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    
    @IBOutlet var overViewTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        overViewTextLabel.font = .boldSystemFont(ofSize: 13)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
