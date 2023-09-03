//
//  TrendingAllViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/09/03.
//

import UIKit

class TrendingAllViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        TrendingAPIManager.shared.callTrendingAllDayRequest { result in
            print(result)
        }
        
    }
}
