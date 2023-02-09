//
//  SearchViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit
import SnapKit
import Alamofire

class SearchViewController: UIViewController {

    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var searchList: [SearchResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getSearchData()
        }
    }
    
    func getSearchData() {
        AF.request("\(Constant.Base_URL)/app/posts/popular", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: SearchResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    
    
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        cell.myImage.image = UIImage(named: searchList[indexPath.row].mediaUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width) / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchTapViewController") as! SearchTapViewController
        searchVC.imagePassed = searchList[indexPath.row].mediaUrl
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
}
