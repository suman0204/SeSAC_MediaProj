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
    
    let saveButton = {
        let view = UIBarButtonItem(title: "완료", style: .plain, target: ProfileViewController.self, action: #selector(saveButtonClicked))
        return view
    }()
    
    
    @objc func saveButtonClicked() {
        
    }
    
    override func loadView() {
        self.view = mainView
        view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "프로필 편집"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
//        navigationItem.rightBarButtonItem = saveButton
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
        
        if typeList[indexPath.row] == .changeToPro || typeList[indexPath.row] == .privateInfo {
            cell.blueLabel.text = typeList[indexPath.row].title
            cell.blueLabelSetConstraints()
            
        } else {
            cell.titleLabel.text = typeList[indexPath.row].title
            cell.contentLabel.text = typeList[indexPath.row].title
        }

        print("extensioncelltype", cell.cellType)
        return cell        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ProfileEditDetailViewController()
        vc.type = typeList[indexPath.row]
        vc.completionHandler = { content in
            if let cell = tableView.cellForRow(at: indexPath) as? ProfileTableViewCell {
                cell.contentLabel.text = content
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
