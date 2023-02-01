//
//  KeepViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class KeepViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
    }
    
    //MARK: navigation bar
    func navibar() {
        title = "보관된 스토리"
        let backImage = UIImage(named: "backBtn")!

        let backBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: backImage.size.width,
            height: backImage.size.height))
        backBtn.setImage(backImage, for: .normal)
        backBtn.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let backButton = UIBarButtonItem(customView: backBtn)
        
        let dotImage = UIImage(named: "dotdotdot")!
        let dotBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: dotImage.size.width,
            height: dotImage.size.height))
        dotBtn.setImage(dotImage, for: .normal)
        dotBtn.addTarget(self, action: #selector(onClickMore), for: .touchUpInside)
        let dotButton = UIBarButtonItem(customView: dotBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = dotButton
    }
    @objc func onClickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onClickMore() {
        print("더 보기")
    }
    
}
