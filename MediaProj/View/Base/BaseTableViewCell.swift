//
//  BaseTableViewCell.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        print("Base TableViewCell")
    }
    
    func setConstraints() {
        
    }
}
