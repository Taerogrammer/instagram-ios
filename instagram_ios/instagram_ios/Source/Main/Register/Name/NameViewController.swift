//
//  NameViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class NameViewController : UIViewController {
    
    var textCnt : Int = 0
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func onClickPassword() {
        if textCnt > 0 {
            guard let passwordVC = self.storyboard?.instantiateViewController(identifier: "PasswordViewController") else {return}
            passwordVC.modalPresentationStyle = .fullScreen
            self.present(passwordVC, animated: true)
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
        nameText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        if let text = textField.text {
            if text.count > 0 {
                nextButton.tintColor = .facebook_check
                textCnt = text.count
            }
            else {
                nextButton.tintColor = .facebook_uncheck
                textCnt = text.count
            }
        }
    }
    
}
