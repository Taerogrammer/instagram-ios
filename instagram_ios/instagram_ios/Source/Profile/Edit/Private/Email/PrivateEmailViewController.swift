//
//  PrivateEmailViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivateEmailViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    lazy var dataManager: PrivateEmailDataManager = PrivateEmailDataManager()
    
    let singleton = PrivateSingleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldImage()
        NavigationBack()
        NavigationPost()
        title = "이메일"
    }

    
    //MARK: text field 옆에 이미지 띄우기
    
    func textFieldImage() {
        textField.addLeftImage(image: UIImage(named: "private_email")!)
        textField.placeholder = "이메일"
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
        print("생일 포스트 완료")
        self.dismissKeyboard()
        self.showIndicator()
        let input = PrivateEmailRequest(email: textField.text ?? "")
        dataManager.patchEmail(input, delegate: self)
    }
    
    
}
extension PrivateEmailViewController {
    func didSuccessEdit() {
        self.presentAlert(title: "회원 정보 수정", message: "이메일 정보가 수정되었습니다")
        singleton.email = textField.text ?? ""
        
        print("didSuccessEdit() success")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
