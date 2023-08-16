//
//  DetailViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/16.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var id: String = ""
    var overViewText: String = ""
    var castList: [Cast] = []
    
    @IBOutlet var HeaderView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var creditTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        creditTableView.delegate = self
        creditTableView.dataSource = self
        
        let overViewNib = UINib(nibName: "OverViewTableViewCell", bundle: nil)
        let castNib = UINib(nibName: "CastTableViewCell", bundle: nil)
        
        creditTableView.register(overViewNib, forCellReuseIdentifier: "OverViewTableViewCell")
        creditTableView.register(castNib, forCellReuseIdentifier: "CastTableViewCell")
        
        TrendingAPIManager.shared.callCreditsRequest(id: id) { result in
            self.castList = result.cast
        }
    }
    



}

extension DetailViewController {
    func configureCastCell() {
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "OverView"
        } else {
            return "Cast"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return castList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "OverViewTableViewCell") as! OverViewTableViewCell
            return cell
            
        } else if indexPath.section == 1 {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "CastTableViewCell") as! CastTableViewCell
            
            let cast = castList[indexPath.row]
            
            print("casttttttt")
            print(cast)
            
            cell.configureCell(cast: cast)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    
}
