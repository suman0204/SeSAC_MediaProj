//
//  BaseView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureView()
        setConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
    }
    
    func setConstrainst() {
        
    }
}
