//
//  ProfileNavigationBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class ProfileNavigationBarViewController : UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Profile NAVIGATION BAR")
        navigationBarSetting()
    }
    


    

    
    
    
    //MARK: Navigation Bar
    func navigationBarSetting() {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "rla_xogud"
        titleLabel.font = .NotoSans(.bold, size: 28)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        let addImage = UIImage(named: "profile_add")!
        let addButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: addImage.size.width,
            height: addImage.size.height))
        addButton.setImage(addImage, for: .normal)
        addButton.addTarget(self, action: #selector(onClickAdd), for: .touchUpInside)
        

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
    
    @objc func onClickAdd() {
        print("onClickAdd()")

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
}

extension ProfileNavigationBarViewController : SettingModalProtocol, ActivityModalProtocol, KeepModalProtocol, QRModalProtocol, SavedModalProtocol, DigitalModalProtocol, BestFriendsModalProtocol, FavoriteModalProtocol {
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
