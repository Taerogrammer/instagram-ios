//
//  RegisterViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class RegisterViewController : UIViewController {

    
    
    
    @IBOutlet weak var buttonColor: UIButton!
    
    //MARK: loginVC로 가는 버튼
    @IBAction func onClickLogin(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") else {return}
        loginVC.modalPresentationStyle = .fullScreen
        loginVC.modalTransitionStyle = .coverVertical

        self.present(loginVC, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonColor.tintColor = .facebook_check
    }
    
    
    
}
