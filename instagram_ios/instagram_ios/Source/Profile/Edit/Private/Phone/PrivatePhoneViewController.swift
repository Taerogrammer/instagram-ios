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
    }
    
    


    
    
    
}
