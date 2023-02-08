//
//  MyFeedViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

import Foundation
import UIKit

class MyFeedViewController : UIViewController {
    
    
    @IBOutlet weak var myFeedCollectionView: UICollectionView!
    
    var imageList: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFeedCollectionView.delegate = self
        myFeedCollectionView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.myFeedCollectionView.reloadData()
        }
    }
    
    
    
    
    
}

extension MyFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("imageLIst >> \(imageList.count)")
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as! MyFeedCollectionViewCell
        
        cell.feedImage.load(url: URL(string: imageList[indexPath.row])!)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width) / 3
        return CGSize(width: size, height: size)
    }

}
