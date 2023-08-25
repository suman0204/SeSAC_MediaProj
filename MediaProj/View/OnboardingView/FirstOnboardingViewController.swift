//
//  FirstOnboardingViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/25.
//

import UIKit
import SnapKit

class FirstOnboardingViewController: UIViewController {
    
    let titleLabel = {
        let view = UILabel()
        view.text = "TMDB"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    
    let mainImage = {
        let view = UIImageView()
        view.image = UIImage(systemName: "popcorn.fill")
        view.tintColor = .black
        return view
    }()
    
    let introduceLabel = {
        let view = UILabel()
        view.text = "각 국의 영화, TV Show 를 확인해보세요"
        view.textAlignment = .center
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [titleLabel, mainImage, introduceLabel].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = .systemTeal
        setUpView()
    }

}

extension FirstOnboardingViewController {
    func setUpView() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(100)
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.size.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        introduceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
}
