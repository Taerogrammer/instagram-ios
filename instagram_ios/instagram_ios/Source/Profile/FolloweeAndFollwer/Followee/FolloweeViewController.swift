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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getFolloweeData()
        }
    }
    
    
    
    
    
    
    
    func getFolloweeData() {
        AF.request("\(Constant.Base_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/following-list", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: FolloweeResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}
