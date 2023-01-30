//
//  PhoneViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class PhoneViewController : UIViewController {
    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var facebookContinueView : UIView!
    @IBAction func onClickName() {
        guard let nameVC = self.storyboard?.instantiateViewController(identifier: "NameViewController") else {return}
        nameVC.modalPresentationStyle = .fullScreen
        self.present(nameVC, animated: false)
        
        
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
        phoneText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        if let text = textField.text {
            if text.count > 0 {
                nextButton.tintColor = .facebook_check
            }
            else {
                nextButton.tintColor = .facebook_uncheck
            }
        }
    }
    
    
}
