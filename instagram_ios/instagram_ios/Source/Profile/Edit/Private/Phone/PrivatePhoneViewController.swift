//
//  PrivatePhoneViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivatePhoneViewController : UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldImage()
        title = "휴대폰 번호"
        BackAndPost()
    }

    
    //MARK: text field 옆에 이미지 띄우기
    func textFieldImage() {
        textField.addLeftImage(image: UIImage(named: "private_phone")!)
        textField.placeholder = "전화번호"
    }
    
    
    


    
    
    
}
