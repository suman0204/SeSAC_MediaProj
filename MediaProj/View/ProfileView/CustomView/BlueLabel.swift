//
//  BlueLabel.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class BlueLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        textColor = .systemBlue
        font = .systemFont(ofSize: 13)
    }
}
