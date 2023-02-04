//
//  StoryViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

import Foundation
import UIKit

class StoryViewController : UIViewController {
    
    var imagePassed: String = ""
    @IBOutlet weak var storyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyImage.image = UIImage(named: imagePassed)
        

//        imageSetting()
        
        naviUserNameAndClose()
    }
    
//    func imageSetting() {
//        storyImage.image = UIImage(named: imagePassed)
//        storyImage.layer.cornerRadius = storyImage.frame.height / 2
//        storyImage.layer.borderWidth = 1
//        storyImage.setGradient(color1: UIColor.red, color2: .systemPink, color3: .yellow)
//        storyImage.clipsToBounds = true
//
//    }
    
    
    
    func naviUserNameAndClose() {
        let userNameButton = UIButton()
        userNameButton.setTitle("userName 넣기", for: .normal)
        userNameButton.setTitleColor(.black, for: .normal)
        userNameButton.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        let barUserNameButton = UIBarButtonItem(customView: userNameButton)
        
        let closeImage = UIImage(named: "closeBtn")!
        let closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: closeImage.size.width, height: closeImage.size.height))
        closeButton.setImage(closeImage, for: .normal)
        closeButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barCloseButton = UIBarButtonItem(customView: closeButton)
        
        self.navigationItem.leftBarButtonItem = barUserNameButton
        self.navigationItem.rightBarButtonItem = barCloseButton
        
    }
    
    @objc func onClickProfile() {
        print("프로필 넘어가기")
    }
    

    
    
    
}
