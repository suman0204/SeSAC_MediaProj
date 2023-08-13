//
//  TrendListViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import UIKit

class TrendListViewController: UIViewController {
    
    var movieList: [Movie] = [] {
        didSet {
            trendListTableView.reloadData()
        }
    }

    @IBOutlet var hamburgerButton: UIBarButtonItem!
    @IBOutlet var searchButton: UIBarButtonItem!
    
    @IBOutlet var trendListTableView: UITableView!
    @IBOutlet var trendListCell: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.shadowImage = nil
        
        trendListTableView.delegate = self
        trendListTableView.dataSource = self
        trendListTableView.separatorStyle = .none
        
        let nib = UINib(nibName: "TrendListTableViewCell", bundle: nil)
        trendListTableView.register(nib, forCellReuseIdentifier: "TrendListTableViewCell")
        

        TrendingAPIManager.shared.callRequest(type: .day) { result in
            print("result=========")
            print(result)
            
            self.movieList = result
        }
        
        print("trednListViewController-=======")
        print(movieList)
    }


}

extension TrendListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trendListTableView.dequeueReusableCell(withIdentifier: "TrendListTableViewCell") as! TrendListTableViewCell
        
        let row = movieList[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
