//
//  ProfileEditDetailViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/30.
//

import UIKit

class ProfileEditDetailViewController: BaseViewController {
    
    let mainView = ProfileEditDetailView()
    
    var type: ProfileEditDetailViewType = .name
    
    let saveButton = {
        let view = UIBarButtonItem()
        return view
    }()
    
    var completionHandler: ((String) -> () )?
    
    

    
    override func loadView() {
        self.view = mainView
        view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = type.title
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        mainView.titleLabel.text = type.title
        mainView.inputTextField.placeholder = type.placeholder
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonClicked))
        
    }
    
    @objc func saveButtonClicked() {
        completionHandler?(mainView.inputTextField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    
}
