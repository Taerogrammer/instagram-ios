//
//  StoryViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

import Foundation
import UIKit
import Alamofire

class StoryViewController : UIViewController {
    
    var imagePassed: String = ""
    @IBOutlet weak var storyImage: UIImageView!
    var storiesUserHave: [Int] = []
    var userId: Int = 0
    var userInfo: GettingStoryResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyImage.image = UIImage(named: imagePassed)
//        naviUserNameAndClose()
        print("view did > \(userId)")
        getStoryId()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
//    func naviUserNameAndClose() {
//        let userNameButton = UIButton()
//        userNameButton.setTitle("userName 넣기", for: .normal)
//        userNameButton.setTitleColor(.black, for: .normal)
//        userNameButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
//        let barUserNameButton = UIBarButtonItem(customView: userNameButton)
//
//        let closeImage = UIImage(named: "closeBtn")!
//        let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: closeImage.size.width, height: closeImage.size.height))
//        closeButton.setImage(closeImage, for: .normal)
//        closeButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
//        let barCloseButton = UIBarButtonItem(customView: closeButton)
//
//        self.navigationItem.leftBarButtonItem = barUserNameButton
//        self.navigationItem.rightBarButtonItem = barCloseButton
//
//    }
    
    @objc func onClickProfile() {
        print("프로필 넘어가기")
    }
    
    func getStoryId() {
        AF.request("\(Constant.Olive_URL)/app/users/\(userId)/stories", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: GetStoryIdResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("GET STORY ID >> \(response.result)")
                DispatchQueue.main.async {
                    AF.request("\(Constant.Olive_URL)/app/stories/\(response.result[0])", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: GettingStoryResponse.self) { response in
                        switch response.result {
                        case .success(let response):
                            print("STORY SUCCESS >> \(response)")
                            DispatchQueue.main.async {
                                self.storyImage.load(url: URL(string: response.result!.mediaUrl)!)
                                self.userInfo = response.result
                                print("유저 인포")
                                print(self.userInfo)
                                //MARK: user name button
                                let userNameButton = UIButton()
                                userNameButton.setTitle("\(self.userInfo!.username)", for: .normal)
                                userNameButton.setTitleColor(.black, for: .normal)
                                userNameButton.addTarget(self, action: #selector(self.onClickProfile), for: .touchUpInside)
                                let barUserNameButton = UIBarButtonItem(customView: userNameButton)
                                
                                let closeImage = UIImage(named: "closeBtn")!
                                let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: closeImage.size.width, height: closeImage.size.height))
                                closeButton.setImage(closeImage, for: .normal)
                                closeButton.addTarget(self, action: #selector(self.onClickBack), for: .touchUpInside)
                                let barCloseButton = UIBarButtonItem(customView: closeButton)
                                
                                self.navigationItem.leftBarButtonItem = barUserNameButton
                                self.navigationItem.rightBarButtonItem = barCloseButton
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
}
