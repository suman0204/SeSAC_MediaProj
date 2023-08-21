//
//  MoreAboutMovieViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/21.
//

import UIKit
import Kingfisher

class MoreAboutMovieViewController: UIViewController {
    
    var id: String = ""
    
    var similarMovie: SimilarMovie?
    var movieVideos: MovieVideos?

    @IBOutlet var similarVideoSegment: UISegmentedControl!
    
    @IBOutlet var moreAboutCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MoreAboutViewDidload")
        moreAboutCollectionView.dataSource = self
        moreAboutCollectionView.delegate = self
        
        if similarVideoSegment.selectedSegmentIndex == 0 {
            moreAboutCollectionView.register(UINib(nibName: MovieSimilarCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieSimilarCollectionViewCell.identifier)
        } else if similarVideoSegment.selectedSegmentIndex == 1 {
            moreAboutCollectionView.register(UINib(nibName: MovieVideosCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieVideosCollectionViewCell.identifier)
        }
        
        configureSegment()
        
        let group = DispatchGroup()
        
        group.enter()
        TrendingAPIManager.shared.callSimilarMovieRequest(id: id) { result in
            self.similarMovie = result
            group.leave()
        } failure: {
            print("No SimilarMovie..")
        }
        
        group.enter()
        TrendingAPIManager.shared.callMovieVideosRequest(id: id) { result in
            self.movieVideos = result
            group.leave()
        } failure: {
            print("No MovieVideos...")
        }
        
        group.notify(queue: .main) {
            print("===Get Response===")
            self.moreAboutCollectionView.reloadData()
        }


        
    }
    

}

extension MoreAboutMovieViewController {
    func configureSegment() {
        //세그먼트 이름 설정
        similarVideoSegment.setTitle("Similar", forSegmentAt: 0)
        similarVideoSegment.setTitle("Video", forSegmentAt: 1)
        
        //처음 선택되어 있는 세그먼트 설정
        similarVideoSegment.selectedSegmentIndex = 0
    }
}

extension MoreAboutMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if similarVideoSegment.selectedSegmentIndex == 0 {
            guard let similarMovieResult = similarMovie?.results else {
                print("No SimilarMovie...")
                return 0
            }
            return similarMovieResult.count
        } else if similarVideoSegment.selectedSegmentIndex == 1 {
            guard let movieVideosResult = movieVideos?.results else {
                print("No MovieVideos...")
                return 0
            }
            return movieVideosResult.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if similarVideoSegment.selectedSegmentIndex == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSimilarCollectionViewCell.identifier, for: indexPath) as? MovieSimilarCollectionViewCell else {
                return UICollectionViewCell()
            }
            guard let url = similarMovie?.results[indexPath.row].posterURL else {
                return UICollectionViewCell()
            }
            
            cell.posterImageView.kf.setImage(with: URL(string: url))
            
            return cell
            
        } else if similarVideoSegment.selectedSegmentIndex == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieVideosCollectionViewCell.identifier, for: indexPath) as? MovieVideosCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            guard let youtubeKey = movieVideos?.results[indexPath.row].key else {
                return UICollectionViewCell()
            }
            
            let link = "https://www.youtube.com/watch?v=" + youtubeKey

            cell.movieVideoLink.text = link
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
