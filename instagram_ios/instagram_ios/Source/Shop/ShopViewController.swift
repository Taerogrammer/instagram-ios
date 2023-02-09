//
//  ShopViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit
import Alamofire

class ShopViewController : UIViewController {
    
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    
    var shoppingList: [ShoppingResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShopCollectionView.delegate = self
        ShopCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getShopping()
    }
    
    
    
    func getShopping() {
        AF.request("\(Constant.Base_URL)/app/shops/products", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: ShoppingResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
                DispatchQueue.main.async {
                    self.shoppingList = response.result
                    self.ShopCollectionView.reloadData()
                }

                
            case .failure(let error):
                print(error)
                
            }
        }

    }
    
    
    
    
    
}

extension ShopViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Shopping LIST >> \(shoppingList.count)")
        return shoppingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ShopCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShopCollectionViewCell
        cell.shoppingImage.load(url: URL(string: shoppingList[indexPath.row].imgUrl)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width) / 2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
}
