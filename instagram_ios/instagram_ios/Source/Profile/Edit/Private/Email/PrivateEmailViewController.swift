//
//  PrivateEmailViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivateEmailViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldImage()
        BackAndPost()
        title = "이메일"
    }

    
    //MARK: text field 옆에 이미지 띄우기
    
    func textFieldImage() {
        textField.addLeftImage(image: UIImage(named: "private_email")!)
        textField.placeholder = "이메일"
    }
    
    
    
    
}
