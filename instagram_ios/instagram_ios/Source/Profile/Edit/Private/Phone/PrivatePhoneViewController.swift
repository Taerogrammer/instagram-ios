//
//  PrivatePhoneViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivatePhoneViewController : UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    let singleton = PrivateSingleton.shared
    lazy var dataManager: PrivatePhoneDataManager = PrivatePhoneDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldImage()
        title = "휴대폰 번호"
        NavigationBack()
        NavigationPost()
    }

    
    //MARK: text field 옆에 이미지 띄우기
    func textFieldImage() {
        textField.addLeftImage(image: UIImage(named: "private_phone")!)
        textField.placeholder = "전화번호"
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
        print("private phone 포스트 완료")
        self.dismissKeyboard()
        self.showIndicator()
        let input = PrivatePhoneRequest(phone: textField.text ?? "")
        dataManager.patchPhone(input, delegate: self)
    }
    
    


    
    
    
}
extension PrivatePhoneViewController {
    func didSuccessEdit() {
        self.presentAlert(title: "회원 정보 수정", message: "전화번호가 수정되었습니다")
        singleton.phone = textField.text ?? ""
        
        print("didSuccessEdit() success")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
