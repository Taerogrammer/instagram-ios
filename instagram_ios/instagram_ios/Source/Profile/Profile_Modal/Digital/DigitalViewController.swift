//
//  DigitalViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class DigitalViewController : UIViewController {
    override func viewDidLoad() {
        navibar()
    }

    //MARK: navigation bar
    func navibar() {
        title = "디지털 자산"
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
        dotBtn.addTarget(self, action: #selector(onClickPlus), for: .touchUpInside)
        let dotButton = UIBarButtonItem(customView: dotBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = dotButton
    }
    @objc func onClickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func onClickPlus() {
        print("더 보기")
    }
}
