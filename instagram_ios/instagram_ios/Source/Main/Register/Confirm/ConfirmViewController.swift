//
//  ConfirmViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class ConfirmViewController : UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var userNameLbl : UILabel!
    lazy var dataManager : ConfirmDataManager = ConfirmDataManager()
    
    let singleton = UserInfoSingleton.shared
    

    
    
    
    @IBAction func confirmRegister(_ sender: AnyObject) {
        self.dismissKeyboard()
        self.showIndicator()
        let name = singleton.name ?? ""
        let email = singleton.email ?? ""
        let password = singleton.password ?? ""
        let phone = singleton.phone ?? ""
        let userName = singleton.userName ?? ""
        
        let input = UserInfoRequest(name: name, email: email, password: password, phone: phone, userName: userName)
        dataManager.postRegister(input, delegate: self)
        
        print("\(name) \(email) \(password) \(phone) \(userName)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.tintColor = .facebook_check
        
        let singleton = UserInfoSingleton.shared
        userNameLbl.text = "\(singleton.userName!)"
    }
    
}

extension ConfirmViewController {
    func didSuccessRegister(_ result: RegisterResult) {
        self.presentAlert(title: "회원가입 성공", message: "회원가입에 성공하였습니다")
        //result.jwt
        print("get jwt")
        let userIdentifier = result.jwt
        UserDefaults.standard.set(userIdentifier, forKey: "LoginIdentifier")
                        
        print(UserDefaults.standard.string(forKey: "LoginIdentifier"))
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
