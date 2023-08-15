//
//  DetailViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/16.
//

import UIKit

class DetailViewController: UIViewController {
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
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "OverViewTableViewCell") as! OverViewTableViewCell
            return cell
        } else {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "CastTableViewCell") as! CastTableViewCell
            return cell
        }
    }
    
    
}
