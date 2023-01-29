//
//  LoginViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/29.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordEyeButton: UIButton!
    
    
    //MARK: password visible
    @IBAction func passwordEyeButtonDidTap(_ sender: Any) {
        //보안 설정
        passwordTextField.isSecureTextEntry.toggle()
        //버튼 선택
        passwordEyeButton.isSelected.toggle()
        //눈 모양 이미지 변경
        let eyeImage = passwordEyeButton.isSelected ? "login_eye_on" : "login_eye_off"
        passwordEyeButton.setImage(UIImage(named: eyeImage) , for: .normal)
        
        
        passwordEyeButton.tintColor = .clear
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        passwordEyeButton.setImage(UIImage(named: "login_eye_off"), for: .normal)
        
    }
    
    
    
    
}
