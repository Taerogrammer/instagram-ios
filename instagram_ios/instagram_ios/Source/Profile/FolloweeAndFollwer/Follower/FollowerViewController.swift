//
//  FollowerViewController.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/02/05.
//

import Foundation
import UIKit
import Alamofire

class FollowerViewController : UIViewController {
    
    @IBOutlet weak var followerCollectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        followerCollectionView.delegate = self
        followerCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getFollowerData()
    }
    
    var follower: [FollowerResult] = []
    
    func getFollowerData() {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/follower-lists", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: FollowerResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
                DispatchQueue.main.async {
                    self.follower = response.result
                    self.followerCollectionView.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    
    
    
    
}
extension FollowerViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
        print(follower.count)
        return follower.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = followerCollectionView.dequeueReusableCell(withReuseIdentifier: "followerCell", for: indexPath) as! FollowerCollectionViewCell
        cell.userNameBtn.setTitle(follower[indexPath.row].userName, for: .normal)
        cell.userNameBtn.setTitleColor(.black, for: .normal)
        cell.userNameBtn.titleLabel?.font = .NotoSans(.bold, size: 10)
        cell.nameLbl.text = follower[indexPath.row].name
        cell.userNameBtn.contentHorizontalAlignment = .left
//        cell.layer.addBorder([.bottom], color: .black, width: 1)
        cell.profileImage.load(url: URL(string: follower[indexPath.row].profileImageUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let otherVC = self.storyboard?.instantiateViewController(withIdentifier: "OtherFeedViewController") as! OtherFeedViewController
        
        otherVC.feedUserId = follower[indexPath.row].userId
        print("νλ‘μ° λͺ©λ‘μμ > \(otherVC.feedUserId)")
        self.navigationController?.pushViewController(otherVC, animated: true)
        
    }
    
    
}
