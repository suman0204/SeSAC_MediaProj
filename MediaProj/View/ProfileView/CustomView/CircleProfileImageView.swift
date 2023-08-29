//
//  CircleProfileImageView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class CircleProfileImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    private func setUpView() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        backgroundColor = .lightGray
        self.contentMode = .scaleAspectFit
        layer.masksToBounds = true
    }
}
