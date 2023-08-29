//
//  ProfileViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    let typeList = ProfileEditDetailViewType.allCases
    
    let mainView = ProfileEditView()
    
    override func loadView() {
        self.view = mainView
        view.backgroundColor = .black
    }
    
    override func configureView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        cell.titleLabel.text = typeList[indexPath.row].title
        cell.contentLabel.text = typeList[indexPath.row].title
        return cell
    }
    
    
}
