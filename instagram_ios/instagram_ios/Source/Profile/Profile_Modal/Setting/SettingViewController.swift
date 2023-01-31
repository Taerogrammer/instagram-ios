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
    }
    
    
    
    func navibar() {
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
        print("onClickBack()")
    }
}
