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
    
    let singleton = EditSingleton.shared

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageCircle()
        
//        InfoInButton()
        NavigationBack()
        title = "프로필 수정"
        print("viewdidload()")
        NavigationPost()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("single 바꼈나 >> \(singleton.name!)")
        InfoInButton()
        
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
    
    
    func NavigationPost() {
        let postBtn = UIButton()
        postBtn.setTitle("완료", for: .normal)
        postBtn.setTitleColor(.black, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPost), for: .touchUpInside)
        let postButton = UIBarButtonItem(customView: postBtn)
        self.navigationItem.rightBarButtonItem = postButton
    }
    
    @objc func onClickPost() {
        print("Edit VC 포스트 완료")
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
    
    
    var textName: String = ""
    var textUserName: String = "userName 받기"
    var textIntro: String = "introduce 받기"
    var textLink: String = "link 받기"
    
    func InfoInButton() {
        
        
        textName = singleton.name ?? ""
        textUserName = singleton.userName ?? ""
        textIntro = singleton.bio ?? ""
        textLink = singleton.site ?? ""
        
        print("잘 들어가있나? \(textName) \(textUserName) \(textIntro)  \(textLink)")
        
        nameBtn.setTitle("\(textName)", for: .normal)
        nameBtn.contentHorizontalAlignment = .left
        userNameBtn.setTitle("\(textUserName)", for: .normal)
        userNameBtn.contentHorizontalAlignment = .left
        introduceBtn.setTitle("\(textIntro)", for: .normal)
        introduceBtn.contentHorizontalAlignment = .left
        linkBtn.setTitle("\(textLink)", for: .normal)
        linkBtn.contentHorizontalAlignment = .left
        
        
        if textName == "" {
            nameBtn.setTitleColor(.gray, for: .normal)
            nameBtn.setTitle("이름", for: .normal)
            
        }
        else {
            nameBtn.setTitleColor(.black, for: .normal)
        }
        
        if textUserName == "" {
            userNameBtn.setTitleColor(.gray, for: .normal)
            userNameBtn.setTitle("사용자 이름", for: .normal)
        }
        else {
            userNameBtn.setTitleColor(.black, for: .normal)
        }
        
        if textIntro == "" {
            introduceBtn.setTitleColor(.gray, for: .normal)
            introduceBtn.setTitle("소개", for: .normal)
        }
        else {
            introduceBtn.setTitleColor(.black, for: .normal)
        }
        
        if textLink == "" {
            linkBtn.setTitleColor(.gray, for: .normal)
            linkBtn.setTitle("링크", for: .normal )
        }
        else {
            linkBtn.setTitleColor(.black, for: .normal)
        }
        
        //이미지 url
//        if textLink == "" {
//            nameBtn.setTitleColor(.gray, for: .normal)
//        }
//        else {
//            userNameBtn.setTitleColor(.black, for: .normal)
//        }
    }
    
    
    
    
}

extension EditViewController {
    func didSuccessEdit(_ result: EditResult) {
        self.presentAlert(title: "회원 정보 수정", message: "회원 정보가 수정되었습니다")
        
        print("didSuccessEdit() success")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
    
}
