//
//  SettingViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class SettingViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SettingViewController loaded")
        navibar()
        ViewBorder()
        loginText()
    }
    
    @IBOutlet weak var ListView : UIView!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var addAccountButton : UIButton!
    @IBOutlet weak var logoutButton : UIButton!
    
    
    func ViewBorder() {
        ListView.layer.addBorder([.bottom], color: UIColor.gray, width: 0.5)
    }
    
    
    
    func navibar() {
        title = "설정"
        let instaImage = UIImage(named: "backBtn")!

        let instaBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: instaImage.size.width,
            height: instaImage.size.height))

        instaBtn.setImage(instaImage, for: .normal)
        instaBtn.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)


        let instaButton = UIBarButtonItem(customView: instaBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = instaButton
    }
    @objc func onClickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func loginText() {
        loginLbl.text = "로그인"
        loginLbl.font = .NotoSans(.bold, size: 16)
        addAccountButton.setTitle("계정 추가", for: .normal)
        addAccountButton.titleLabel?.font = .NotoSans(.medium, size: 12)
        addAccountButton.tintColor = .facebook_check
        logoutButton.setTitle("(유저네임) 로그아웃", for: .normal)
        logoutButton.titleLabel?.font = .NotoSans(.medium, size: 12)
        logoutButton.tintColor = .facebook_check
    }
    
    
}
