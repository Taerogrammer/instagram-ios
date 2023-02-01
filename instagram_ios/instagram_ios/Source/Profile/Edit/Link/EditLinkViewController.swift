//
//  LinkViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditLinkViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
    }
    
    
    
    
    func navibar() {
        title = "링크"

        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: backImage.size.width,
            height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)

        self.navigationItem.leftBarButtonItem = barBackButton

    }
    
    @objc func onClickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func onClickPost() {
        print("Post 완료")
    }
}
