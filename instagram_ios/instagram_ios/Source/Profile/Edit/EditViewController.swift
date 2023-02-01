//
//  EditViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditViewController : UIViewController {
    
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameBtn : UIButton!
    @IBOutlet weak var userNameBtn : UIButton!
    @IBOutlet weak var introduceBtn : UIButton!
    @IBOutlet weak var linkBtn : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageCircle()
        InfoInButton()
        BackAndPost()
        title = "프로필 수정"
    }

    //MARK: profile and avatar image
    func makeImageCircle() {
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = CGColor(gray: 1, alpha: 1)
        profileImage.clipsToBounds = true
        
        avatarImage.layer.cornerRadius = profileImage.frame.height / 2
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = CGColor(gray: 1, alpha: 1)
        avatarImage.clipsToBounds = true
    }
    
    
    //MARK: navigation button
    @IBAction func goToName(_ sender: Any) {
        let NameVC = storyboard?.instantiateViewController(withIdentifier: "EditNameViewController") as! EditNameViewController
        self.navigationController?.pushViewController(NameVC, animated: true)
    }
    @IBAction func goToUserName(_ sender: Any) {
        let NameVC = storyboard?.instantiateViewController(withIdentifier: "EditUserNameViewController") as! EditUserNameViewController
        self.navigationController?.pushViewController(NameVC, animated: true)
    }
    @IBAction func goToIntroduce(_ sender: Any) {
        let NameVC = storyboard?.instantiateViewController(withIdentifier: "EditIntroduceViewController") as! EditIntroduceViewController
        self.navigationController?.pushViewController(NameVC, animated: true)
    }
    @IBAction func goToLink(_ sender: Any) {
        let NameVC = storyboard?.instantiateViewController(withIdentifier: "EditLinkViewController") as! EditLinkViewController
        self.navigationController?.pushViewController(NameVC, animated: true)
    }
    @IBAction func goToPrivate(_ sender: Any) {
        let NameVC = storyboard?.instantiateViewController(withIdentifier: "EditPrivateViewController") as! EditPrivateViewController
        self.navigationController?.pushViewController(NameVC, animated: true)
    }

    
    //MARK: button 안에 정보 넣기
    
    var textName: String = "name 받기"
    var textUserName: String = "userName 받기"
    var textIntro: String = "introduce 받기"
    var textLink: String = "link 받기"
    
    func InfoInButton() {
        nameBtn.setTitle("\(textName)", for: .normal)
        nameBtn.setTitleColor(.gray, for: .normal)
        nameBtn.contentHorizontalAlignment = .left
        userNameBtn.setTitle("\(textUserName)", for: .normal)
        userNameBtn.setTitleColor(.gray, for: .normal)
        userNameBtn.contentHorizontalAlignment = .left
        introduceBtn.setTitle("\(textIntro)", for: .normal)
        introduceBtn.setTitleColor(.gray, for: .normal)
        introduceBtn.contentHorizontalAlignment = .left
        linkBtn.setTitle("\(textLink)", for: .normal)
        linkBtn.setTitleColor(.gray, for: .normal)
        linkBtn.contentHorizontalAlignment = .left
        
    }
    
    
    
    
}
