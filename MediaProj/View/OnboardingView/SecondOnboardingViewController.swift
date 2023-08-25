//
//  SecondOnboardingViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/25.
//

import UIKit
import SnapKit

class SecondOnboardingViewController: UIViewController {
    
    let textLabel: UILabel = {
        let view = UILabel()
        view.text = "유사 영상을 추천해드려요!"
        view.textColor = .black
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    
    let startButton: UIButton = {
        let view = UIButton()
        view.setTitle("시작하기", for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [textLabel, startButton].forEach {
            view.addSubview($0)
        }
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        
        setUpView()
    }
    

}

extension SecondOnboardingViewController {
    func setUpView() {
        textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view).multipliedBy(0.8)
            make.height.equalTo(60)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
    }
    
    @objc func startButtonClicked() {
        UserDefaults.standard.set(true, forKey: "isLaunched")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "TrendListView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TrendListViewController") as! TrendListViewController
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
