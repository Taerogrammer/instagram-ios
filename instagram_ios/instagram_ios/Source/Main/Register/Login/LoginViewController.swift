//
//  LoginViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/29.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordEyeButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func Login(_ sender: AnyObject) {
        print("Login() success")
        //ID validation
        guard let id = idTextField.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        //Password validation
        guard let password = passwordTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        //Request Sign In
        self.dismissKeyboard()
        self.showIndicator()
        let input = LoginRequest(loginInput: id, password: password)
        dataManager.postLogin(input, delegate: self)
    }

    var idCnt: Bool = false
    var pwdCnt: Bool = false
    lazy var dataManager: LoginDataManager = LoginDataManager()
    
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
    
    @IBAction func onClickRegister(_sender: Any) {
        self.dismiss(animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        passwordEyeButton.setImage(UIImage(named: "login_eye_off"), for: .normal)
        loginButton.tintColor = .facebook_uncheck

        DispatchQueue.main.async {
            self.CountId()
            self.CountPwd()
        }
        
    }
    
    // MARK: - [실시간 텍스트 필드 값 변경 감지]
    func CountId() {
        idTextField.addTarget(self, action: #selector(self.idFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    func CountPwd() {
        passwordTextField.addTarget(self, action: #selector(self.pwdFieldDidChange(_:)), for: .editingChanged) // 텍스트 필드 실시간 데이터 변경 이벤트 감지
    }
    @objc private func idFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        
        if let id = textField.text {
            if id.count > 0 {
                idCnt = true
                print("\(idCnt) : ID Bool")
                loginButton.tintColor = .facebook_check
            }
            else {
                loginButton.tintColor = .facebook_uncheck
                idCnt = false
                print("\(idCnt) : ID Bool")
            }
        }
    }
    @objc private func pwdFieldDidChange(_ textField: UITextField) {
        // [실시간 입력 값 체크 실시]
        
        if let pwd = textField.text {
            if pwd.count > 0 {
                print("\(pwdCnt) : PWD Bool")
                loginButton.tintColor = .facebook_check
                
            }
            else {
                pwdCnt = false
                print("\(pwdCnt) : PWD Bool")
                loginButton.tintColor = .facebook_uncheck
            }
        }
        
        
        
    }
    
    
}

extension LoginViewController {
    func didSuccessLogin(_ result: LoginResult) {
        //result.jwt
        print("get jwt")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier:"TabBarController")else{return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
