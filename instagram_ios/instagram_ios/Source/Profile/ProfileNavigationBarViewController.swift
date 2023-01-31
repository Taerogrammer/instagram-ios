//
//  ProfileNavigationBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class ProfileNavigationBarViewController : UIViewController, SettingModalProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Profile NAVIGATION BAR")
        navigationBarSetting()
    }
    
    func deliverySetting() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("clicked")
        
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
        print("onClickMenu()")
        let storyboard = UIStoryboard(name: "ProfileModalViewController", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "ProfileModalViewController") as! ProfileModalViewController
        sheetPresentationController.rootView = self
        sheetPresentationController.delegate = self
        self.present(sheetPresentationController, animated: true)
    }
}
