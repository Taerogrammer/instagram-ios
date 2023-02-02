//
//  SavedViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class SavedViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navibar()
    }
    
    
    
    //MARK: navigation bar
    func navibar() {
        title = "저장됨"
        let backImage = UIImage(named: "backBtn")!

        let backBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: backImage.size.width,
            height: backImage.size.height))
        backBtn.setImage(backImage, for: .normal)
        backBtn.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let backButton = UIBarButtonItem(customView: backBtn)
        
        let plusImage = UIImage(named: "plusBtn")!
        let plusBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: plusImage.size.width,
            height: plusImage.size.height))
        plusBtn.setImage(plusImage, for: .normal)
        plusBtn.addTarget(self, action: #selector(onClickPlus), for: .touchUpInside)
        let plusButton = UIBarButtonItem(customView: plusBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc func onClickPlus() {
        print("컬렉션 추가")
    }
    
    
    
}
