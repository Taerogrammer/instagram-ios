//
//  FolloweeViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/05.
//

import Foundation
import UIKit
import Alamofire

class FolloweeViewController : UIViewController {
    
    @IBOutlet weak var followeeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        followeeCollectionView.delegate = self
        followeeCollectionView.dataSource = self
        getFolloweeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")


    }
    
    

    
    var following: [FolloweeResult] = []
    
    
    
    func getFolloweeData() {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/following-lists", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: FolloweeResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
                DispatchQueue.main.async {
                    self.following = response.result
                    self.followeeCollectionView.reloadData()
                }
//                self.following = response.result
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}

extension FolloweeViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
        print(following.count)
        return following.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = followeeCollectionView.dequeueReusableCell(withReuseIdentifier: "followeeCell", for: indexPath) as! FolloweeCollectionViewCell
        cell.userNameBtn.setTitle(following[indexPath.row].userName, for: .normal)
        cell.userNameBtn.setTitleColor(.black, for: .normal)
        cell.userNameBtn.titleLabel?.font = .NotoSans(.bold, size: 10)
        cell.userNameBtn.contentHorizontalAlignment = .left

        cell.nameLbl.text = following[indexPath.row].name
        
//        cell.layer.addBorder([.bottom], color: .black, width: 1)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let otherVC = self.storyboard?.instantiateViewController(withIdentifier: "OtherFeedViewController") as! OtherFeedViewController
        
        otherVC.feedUserId = following[indexPath.row].userId
        print("팔로우 목록에서 > \(otherVC.feedUserId)")
        self.navigationController?.pushViewController(otherVC, animated: true)
        
    }
    
    
}
