//
//  TrendingAllViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/09/03.
//

import UIKit

class TrendingAllViewController: BaseViewController {
    
    var trendingAll: TrendingAll?
    
    let mainView = TrendingAllView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        TrendingAPIManager.shared.callTrendingAllDayRequest { result in
            
            guard let result = result else {
                print("NO Result present Alert")
                return
            }
            print(result)
            self.trendingAll = result
            self.mainView.tableView.reloadData()
        }
    }
    
    override func configureView() {
        super.configureView()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}


extension TrendingAllViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingAll?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if trendingAll?.results[indexPath.row].mediaType == .movie {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendListTableViewCell") as! TrendListTableViewCell
            if let row = trendingAll?.results[indexPath.row] {
                cell.configureCellTrednAllData(row: row)
            }
            return cell
        } else if trendingAll?.results[indexPath.row].mediaType == .tv {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingAllTVCell") as! TrendingAllTVCell
            if let row = trendingAll?.results[indexPath.row] {
                cell.configureCellData(row: row)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
