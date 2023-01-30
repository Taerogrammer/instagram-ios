//
//  FacebookLoginViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class FacebookViewController : UIViewController {
    @IBOutlet weak var facebookID : UITextField!
    @IBOutlet weak var facebookPwd: UITextField!
    @IBAction func FacebookLogin(_ sender: AnyObject) {
        print("FacebookLogin() success")
        //ID validation
        guard let id = facebookID.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        //Password validation
        guard let password = facebookPwd.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        //Request Sign In
        self.dismissKeyboard()
        self.showIndicator()
        let input = FacebookRequest(loginId: id, password: password)
        dataManager.postLogin(input, delegate: self)
    }
    
    func PwdSecure() {
        facebookPwd.isSecureTextEntry = true
    }
    
    lazy var dataManager : FacebookDataManager = FacebookDataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PwdSecure()
        
    }
    
    
    
    
    
}

extension FacebookViewController {
    func didSuccessLogin(_ result: FacebookResult) {
        self.presentAlert(title: "로그인 성공", message: "로그인에 성공하였습니다")
        //result.jwt
        print("get jwt")
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
//            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"MainViewController")else{return}
//            self.navigationController?.pushViewController(nextVC, animated: true)
//        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
