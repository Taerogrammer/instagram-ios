//
//  SearchViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit
import SnapKit


class SearchViewController: UIViewController {

    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var designPhoto: [String] = ["menu1", "menu2", "menu3", "menu4", "menu5", "menu6","menu7","menu8","profile_add","facebook_logo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}


extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return designPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        cell.myImage.image = UIImage(named: designPhoto[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width) / 3
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchTapViewController") as! SearchTapViewController
        searchVC.imagePassed = designPhoto[indexPath.row]
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
}
