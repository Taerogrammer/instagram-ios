//
//  EditNameViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditNameViewController : UIViewController {
    
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var nameDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
        DescriptionSetting()
    }
    
    
    
    //MARK: navigation bar
    func navibar() {
        title = "이름"

        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: backImage.size.width,
            height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        let postBtn = UIButton()
        postBtn.setTitle("완료", for: .normal)
        postBtn.setTitleColor(.systemBlue, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPost), for: .touchUpInside)
        let postButton = UIBarButtonItem(customView: postBtn)

        self.navigationItem.leftBarButtonItem = barBackButton
        self.navigationItem.rightBarButtonItem = postButton
    }
    
    @objc func onClickBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func onClickPost() {
        print("Post 완료")
    }
    
    
    func DescriptionSetting() {
        nameDescription.text = "사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을 사용하여 회원님의 계정을 찾을 수 있도록 도와주세요. 이름은 14일 안에 두 번만 변경할 수 있습니다."
        nameDescription.textColor = .gray
        nameDescription.font = .NotoSans(.medium, size: 12)
    }
    
    
    
    
}
