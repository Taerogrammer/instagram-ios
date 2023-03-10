//
//  UserNameViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class UserNameViewController : UIViewController {
    
    var textCnt : Int = 0
    var userNameData : String = ""
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var nextButton : UIButton!
    @IBAction func onClickConfirm() {
        if textCnt > 0 {
            let singleton = UserInfoSingleton.shared
            singleton.userName = userNameData
            guard let confirmVC = self.storyboard?.instantiateViewController(identifier: "ConfirmViewController") else {return}
            confirmVC.modalPresentationStyle = .fullScreen
            self.present(confirmVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.tintColor = .facebook_uncheck
        DispatchQueue.main.async {
            self.CountText()
        }
        
    }
    
    
    
    func CountText() {
        userNameText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        if let text = textField.text {
            if text.count > 0 {
                nextButton.tintColor = .facebook_check
                textCnt = text.count
                userNameData = text
            }
            else {
                nextButton.tintColor = .facebook_uncheck
                textCnt = text.count
            }
        }
    }
}
