//
//  TrendListViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import UIKit

class TrendListViewController: UIViewController {
    
    var trendMovie: TrendingMovie? {
        didSet {
            trendListTableView.reloadData()
        }
    }
    
//    var credits: Credits?
        
    

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
            
            self.trendMovie = result
            print("trendMoiveeeeeeee")
            print(self.trendMovie)
          
                
//                for movie in self.trendMovie!.results {
//                    print("movieeeeee")
//                    print(movie)
//                    TrendingAPIManager.shared.callCreditsRequest(id: "\(movie.id)") { result in
//                        print("result==========credit")
//                        print(result)
//                        self.credits?.append(result)
//                        print("resultnameeeeee")
//                        print(result.castNameList)
//                        print("CallCreditsRequestsssss")
//                        print(self.credits)
//                    }
//                }
            
        }
        
        print("trednListViewController-=======")
        print(trendMovie)
//        print(credits)
        print("trednListViewController-credits=======")

    }


}

extension TrendListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result: Int = 0
        
        if let numberOfRows = trendMovie?.results.count  {
            result = numberOfRows
        } else {
            print("no count")
        }
        
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trendListTableView.dequeueReusableCell(withIdentifier: "TrendListTableViewCell") as! TrendListTableViewCell
        print("row======")
        print(trendMovie)
        print(trendMovie?.results[indexPath.row])

        
        if let row = trendMovie?.results[indexPath.row] {

            
            cell.configureCellData(row: row)
            

        } else {
            print("no row")
        }
        
//        let row = tredMovie!.results[indexPath.row]
//        print("type=====")
//        print(type(of: row))
//        cell.configureCell(row: row)
//
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var id = ""
        
        if let rowID = trendMovie?.results[indexPath.row].id {
            id = "\(rowID)"
        } else {
            print("no id")
        }
//
        let sb = UIStoryboard(name: "DetailViewController", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
//            print("navigationt")
            return
        }
        vc.id = id
        vc.overViewText = trendMovie?.results[indexPath.row].overview ?? "No OverView"
        
        navigationController?.pushViewController(vc, animated: true)

        
        print("didselect")
    }
}
