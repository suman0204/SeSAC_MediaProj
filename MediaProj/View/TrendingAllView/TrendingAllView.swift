//
//  TrendingAllView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/09/03.
//

import UIKit

class TrendingAllView: BaseView {
    
    let tableView = {
        let view = UITableView()
        view.register(TrendingAllTVCell.self, forCellReuseIdentifier: "TrendingAllTVCell")
        view.register(TrendListTableViewCell.self, forCellReuseIdentifier: "TrendListTableViewCell")
        return view
    }()
    
    override func configureView() {
        addSubview(tableView)
    }
    
    override func setConstrainst() {
        tableView.snp.makeConstraints { make in
            make.size.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
