//
//  OtherFeedViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//

import Foundation
import UIKit
import Alamofire

class OtherFeedViewController: UIViewController {
    
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followStateBtn: UIButton!
    @IBOutlet weak var messageBtn: UIButton!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var myFeedView : UIView!
    @IBOutlet weak var tagFeedView : UIView!
    
    
    var feedUserId: Int = 0     //유저 고유 인덱스 아이디
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(feedUserId)
        defaultSeg()
        segmentedControl.addUnderlineForSelectedSegment()
        DispatchQueue.main.async {
            self.getOtherInfo()
        }
        
        NavigationBack()
    }
    
    
    //MARK: segment control
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myFeedView.isHidden = false
            tagFeedView.isHidden = true
        }
        else {
            myFeedView.isHidden = true
            tagFeedView.isHidden = false
        }
    }
    func defaultSeg() {
        myFeedView.isHidden = false
        tagFeedView.isHidden = true
        
        let backgroundImage = UIImage()
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        
    }
    @IBAction func segmentedControlUnderLine(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
    }
    

    
    
    func getOtherInfo() {
        AF.request("\(Constant.Base_URL)/app/users/profile/\(feedUserId)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: ProfileResponse.self) { response in
            print("\(Constant.Base_URL)/app/users/profile/\(self.feedUserId)")
            switch response.result {
            case .success(let response):
                print("SUCCESS >>> \(response)")
//                print(response.result?.follower)  형식
                self.postCount.text = String(response.result?.postCount ?? 0)
                self.followerCount.text = String(response.result?.follower ?? 0)
                self.followingCount.text = String(response.result?.following ?? 0)
                self.nameLbl.text = response.result?.profileUserDto?.name ?? ""
                self.introduceLbl.text = response.result?.profileUserDto?.bio ?? ""
                self.linkLbl.text = response.result?.profileUserDto?.link ?? ""
                var urlString: String = response.result?.profileUserDto?.profileUrl ?? ""
                var baseUrl: String = "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg"
                self.profileImage.load(url: ((URL(string: urlString) ?? URL(string: baseUrl))!))
                self.title = response.result?.profileUserDto?.username!
                self.messageBtn.setTitle("메시지", for: .normal)
                self.messageBtn.titleLabel?.font = .NotoSans(.bold, size: 4)
                self.messageBtn.contentHorizontalAlignment = .center
                self.messageBtn.layer.cornerRadius = 10
                if response.result?.followState == true {   //내가 구독을 한 사람의 피드를 볼 때
                    self.followStateBtn.setTitle("팔로잉v", for: .normal)
                    self.followStateBtn.setTitleColor(.black, for: .normal)
                    self.followStateBtn.titleLabel?.font = .NotoSans(.bold, size: 4)
                    self.followStateBtn.backgroundColor = .systemGray6
                    self.followStateBtn.contentVerticalAlignment = .center
                    self.followStateBtn.layer.cornerRadius = 10
                }
                else {
                    self.followStateBtn.setTitle("맞팔로우 하기", for: .normal)
                    self.followStateBtn.setTitleColor(.white, for: .normal)
                    self.followStateBtn.backgroundColor = .systemBlue
                    self.followStateBtn.titleLabel?.font = .NotoSans(.bold, size: 4)
                    self.followStateBtn.contentHorizontalAlignment = .center
                    self.followStateBtn.layer.cornerRadius = 10
                }
                
//                print("uesrName Data --> \(self.userNameData)")
            case.failure(let error):
                print("FAILED ..\(error)")
            }
            
        }
    }
    
    
    
}
