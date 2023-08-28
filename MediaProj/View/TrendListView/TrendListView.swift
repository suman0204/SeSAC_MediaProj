//
//  TrendListView.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit

class TrendListView: BaseView {
    lazy var tableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(TrendListTableViewCell.self, forCellReuseIdentifier: "TrendListTableViewCell")
        return view
    }()
    
    override func configureView() {
        print("table")
        addSubview(tableView)
    }
    
    override func setConstrainst() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
