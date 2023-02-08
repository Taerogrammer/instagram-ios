//
//  EmailViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class EmailViewController : UIViewController {
    
    let singletonPrivate = PrivateSingleton.shared
    
    var textCnt : Int = 0
    var emailData: String = ""
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var facebookContinueView : UIView!
    @IBAction func onClickName() {
        if emailData.validateEmail() == true && textCnt > 0 {
            let singleton = UserInfoSingleton.shared
            singleton.email = emailData
            singleton.phone = nil
            
            singletonPrivate.email = emailData
            singletonPrivate.phone = nil
            
            guard let nameVC = self.storyboard?.instantiateViewController(identifier: "NameViewController") else {return}
            nameVC.modalPresentationStyle = .fullScreen
            self.present(nameVC, animated: false)
        }
        
        else if emailData.validateEmail() == false {
            self.presentAlert(title: "이메일 형식을 맞춰주세요.")
        }
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookContinueView.isHidden = true
        nextButton.tintColor = .facebook_uncheck
        
        DispatchQueue.main.async {
            self.CountText()
        }
    }
    
    
    
    func CountText() {
        emailText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        if let text = textField.text {
            if text.count > 0 {
                nextButton.tintColor = .facebook_check
                textCnt = text.count
                emailData = text
            }
            else {
                nextButton.tintColor = .facebook_uncheck
                textCnt = text.count
            }
        }
    }
    
    
}
