//
//  ProfileViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit
import Alamofire


class ProfileViewController : UIViewController {
 
    @IBOutlet weak var highlightView : UIView!
    @IBOutlet weak var feedView : UIView!
    @IBOutlet weak var storyHighlight: NSLayoutConstraint!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var myFeedView : UIView!
    @IBOutlet weak var tagFeedView : UIView!
    
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    var countHighlight: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ProfileVC load")
        
        print("UserDefaults == \(UserDefaults.standard.integer(forKey: "userIdx"))")
        print("UserDefaults == \(UserDefaults.standard.string(forKey: "userJwt")!)")
        DispatchQueue.main.async {
            self.HighlightOnOff()
        }

        
        defaultSeg()
        segmentedControl.addUnderlineForSelectedSegment()
        fontSetting()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        DispatchQueue.main.async {
            self.getProfile()
        }
    }
    
    //MARK: story highlight 유무
    func HighlightOnOff() {
        if countHighlight == 0 {
            highlightView.isHidden = true
            storyHighlight.constant = 0 - highlightView.frame.height
        }
        else {
            highlightView.isHidden = false
        }

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
    @IBAction func editProfile(_ sender: AnyObject) {
        let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    func fontSetting() {
        nameLbl.font = .NotoSans(.bold, size: 16)
        introduceLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.textColor = .systemBlue
    }
    

    //MARK: 이름, 소개글, 링크 유무에 따라 view 올리고 내리기 --> 나중에 데이터 들어오면 구현
    
    
    
    
    func getProfile() {
        AF.request("\(Constant.Base_URL)/app/users/profile/\(UserDefaults.standard.integer(forKey: "userIdx"))", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: ProfileResponse.self) { response in
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
//                print("uesrName Data --> \(self.userNameData)")
                let editSingle = EditSingleton.shared

                editSingle.userName = response.result?.profileUserDto?.username ?? ""
                editSingle.name = response.result?.profileUserDto?.name ?? ""
                editSingle.bio = response.result?.profileUserDto?.bio ?? ""
                editSingle.profileUrl = response.result?.profileUserDto?.profileUrl ?? ""
                editSingle.link = response.result?.profileUserDto?.link ?? ""
         
            case.failure(let error):
                print("FAILED ..\(error)")
            }
            
        }
    }
    

}

