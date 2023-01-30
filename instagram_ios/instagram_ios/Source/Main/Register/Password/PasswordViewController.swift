//
//  PasswordViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class PasswordViewController : UIViewController {
    
    var textCnt: Int = 0
    var pwdData : String = ""
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var nextButton : UIButton!
    @IBAction func onClickUserName() {
        if textCnt > 5 {
            let singleton = UserInfoSingleton.shared
            singleton.password = pwdData
            guard let userNameVC = self.storyboard?.instantiateViewController(identifier: "UserNameViewController") else {return}
            userNameVC.modalPresentationStyle = .fullScreen
            self.present(userNameVC, animated: true)
        }
    }
    
    func PwdSecure() {
        passwordText.isSecureTextEntry = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.tintColor = .facebook_uncheck
        PwdSecure()
        DispatchQueue.main.async {
            self.CountText()
        }
    }
    
    
    
    func CountText() {
        passwordText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        if let text = textField.text {
            if text.count > 5 {
                nextButton.tintColor = .facebook_check
                textCnt = text.count
                pwdData = text
            }
            else {
                nextButton.tintColor = .facebook_uncheck
                textCnt = text.count
            }
        }
    }

}
