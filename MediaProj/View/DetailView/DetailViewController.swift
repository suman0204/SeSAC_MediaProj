//
//  DetailViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/16.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    var id: String = ""
    var overViewText: String = ""

    var credits: Credits? {
        didSet {
            creditTableView.reloadData()
        }
    }
    @IBOutlet var moreInfoButton: UIBarButtonItem!
    
    @IBOutlet var HeaderView: UIView!
    @IBOutlet var backDropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var creditTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "출연 / 제작"
        
        moreInfoButton.title = "More"
        moreInfoButton.tintColor = .black
        
        creditTableView.delegate = self
        creditTableView.dataSource = self
        
        let overViewNib = UINib(nibName: "OverViewTableViewCell", bundle: nil)
        let castNib = UINib(nibName: "CastTableViewCell", bundle: nil)
        
        creditTableView.register(overViewNib, forCellReuseIdentifier: "OverViewTableViewCell")
        creditTableView.register(castNib, forCellReuseIdentifier: "CastTableViewCell")
        
        
        TrendingAPIManager.shared.callCreditsRequest(id: "\(movie.id))") { result in
            print("callCreditsRequestcallCreditsRequest")
            print(result)
            self.credits = result
        } failure: {
            print("Error")
        }
        
        print("detailviewcontroller didload")
        print(id)
        print(overViewText)

        configureCastCell(movie: movie)
        
    }
    
    @IBAction func moreInfoButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "DetailViewController", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MoreAboutMovieViewController.identifier) as? MoreAboutMovieViewController else {
            return
        }

        vc.id = "\(movie.id)"
        
        navigationController?.pushViewController(vc, animated: true)
     
    }
    


}

extension DetailViewController {
    func configureCastCell(movie: Movie) {
        titleLabel.text = movie.title 
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 23)
        
        backDropImage.kf.setImage(with: URL(string: movie.backdropURL))
        backDropImage.contentMode = .scaleAspectFill
        
        posterImage.kf.setImage(with: URL(string: movie.posterURL))
        posterImage.contentMode = .scaleAspectFill
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
            return credits?.cast.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1{
            return 100
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "OverViewTableViewCell") as! OverViewTableViewCell
            cell.overViewTextLabel.text = movie?.overview
            return cell
                        
        } else if indexPath.section == 1 {
            let cell = creditTableView.dequeueReusableCell(withIdentifier: "CastTableViewCell") as! CastTableViewCell
            
            guard let cast = credits?.cast[indexPath.row] else {
                print("no casttt")
                return UITableViewCell()
                
            }
            
            print("casttttttt")
            print(cast)
            
            cell.configureCell(cast: cast)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    
}
