//
//  WhiteLabel.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/30.
//

import UIKit

class WhiteLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        textColor = .white
        font = .systemFont(ofSize: 14)
        
    }
}
