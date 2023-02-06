//
//  ProfileNavigationBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit
import Alamofire

class ProfileNavigationBarViewController : UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Profile NAVIGATION BAR")
        navigationBarSetting()
        DispatchQueue.main.async {
            self.getUserName()
        }
        
    }

    
    //MARK: Navigation Bar
    func navigationBarSetting() {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
//        titleLabel.text = "rla_xogud"
        titleLabel.font = .NotoSans(.bold, size: 28)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        let addImage = UIImage(named: "profile_add")!
        let addButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: addImage.size.width,
            height: addImage.size.height))
        addButton.setImage(addImage, for: .normal)
        addButton.addTarget(self, action: #selector(onClickMake), for: .touchUpInside)
        

        let barAddButton = UIBarButtonItem(customView: addButton)
        
        let menuImage = UIImage(named: "profile_menu")!

        let menuButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: menuImage.size.width,
            height: menuImage.size.height))
        menuButton.setImage(menuImage, for: .normal)
        menuButton.addTarget(self, action: #selector(onClickMenu), for: .touchUpInside)
        

        let barMenuButton = UIBarButtonItem(customView: menuButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        spacer.width = 28
        
        self.navigationItem.rightBarButtonItems = [barMenuButton, spacer, barAddButton]
    }
    
    @objc func onClickMake() {
        let storyboard = UIStoryboard(name: "ProfileMakeViewController", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "ProfileMakeViewController") as! ProfileMakeViewController
        sheetPresentationController.reelsDelegate = self
        sheetPresentationController.contentsDelegate = self
        sheetPresentationController.storyDelegate = self
        sheetPresentationController.highlightDelegate = self
        sheetPresentationController.liveDelegate = self
        sheetPresentationController.guideDelegate = self
        self.present(sheetPresentationController, animated: true)
    }
    @objc func onClickMenu() {
        let storyboard = UIStoryboard(name: "ProfileModalViewController", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "ProfileModalViewController") as! ProfileModalViewController
        sheetPresentationController.rootView = self
        sheetPresentationController.delegate = self
        sheetPresentationController.activityDelegate = self
        sheetPresentationController.keepDelegate = self
        sheetPresentationController.QRDelegate = self
        sheetPresentationController.saveDelegate = self
        sheetPresentationController.digitalDelegate = self
        sheetPresentationController.bestFriendDelegate = self
        sheetPresentationController.favoriteDelegate = self
        self.present(sheetPresentationController, animated: true)
    }
    
    
    
    //MARK: userName 불러오기
    func getUserName() {
        AF.request("\(Constant.Base_URL)/app/users/profile/\(UserDefaults.standard.integer(forKey: "userIdx"))", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: ProfileResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >>> \(response)")
                self.title = response.result?.profileUserDto?.username
         case.failure(let error):
                print("FAILED ..\(error)")
            }
            
        }
    }

}

extension ProfileNavigationBarViewController : SettingModalProtocol, ActivityModalProtocol, KeepModalProtocol, QRModalProtocol, SavedModalProtocol, DigitalModalProtocol, BestFriendsModalProtocol, FavoriteModalProtocol, ReelsProtocol, ContentsProtocol, StoryProtocol, HighlightProtocol, LiveProtocol, GuideProtocol {
    func reelsSetting() {
        let reelsVC = storyboard?.instantiateViewController(withIdentifier: "MakeReelsViewController") as! MakeReelsViewController
        self.navigationController?.pushViewController(reelsVC, animated: true)
    }
    
    func contentsSetting() {
        let contentsVC = storyboard?.instantiateViewController(withIdentifier: "MakeContentsViewController") as! MakeContentsViewController
        self.navigationController?.pushViewController(contentsVC, animated: true)
    }
    
    func storySetting() {
        let storyVC = storyboard?.instantiateViewController(withIdentifier: "MakeStoryViewController") as! MakeStoryViewController
        self.navigationController?.pushViewController(storyVC, animated: true)
    }
    
    func highlightSetting() {
        let highlightVC = storyboard?.instantiateViewController(withIdentifier: "MakeHighlightsViewController") as! MakeHighlightsViewController
        self.navigationController?.pushViewController(highlightVC, animated: true)
    }
    
    func liveSetting() {
        let liveVC = storyboard?.instantiateViewController(withIdentifier: "MakeLiveViewController") as! MakeLiveViewController
        self.navigationController?.pushViewController(liveVC, animated: true)
    }
    
    func guideSetting() {
        let guideVC = storyboard?.instantiateViewController(withIdentifier: "MakeGuideViewController") as! MakeGuideViewController
        self.navigationController?.pushViewController(guideVC, animated: true)
    }
    
    func deliverySetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("clicked")
        
    }
    func activitySetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityViewController") as! ActivityViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("ActivityViewController()")
    }
    func keepSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "KeepViewController") as! KeepViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("KeepViewController()")
    }
    func QRSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QRViewController") as! QRViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("QRViewController()")
    }
    func saveSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SavedViewController") as! SavedViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("SavedViewController()")
    }
    func digitalSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DigitalViewController") as! DigitalViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("DigitalViewController()")
    }
    func bestFriendsSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BestFriendsViewController") as! BestFriendsViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("BestFriendsViewController()")
    }
    func favoriteSetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("FavoriteViewController()")
    }

}
