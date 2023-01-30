//
//  FacebookLoginViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class FacebookViewController : UIViewController {
    @IBOutlet weak var facebookID : UITextField!
    @IBOutlet weak var facebookPwd: UITextField!
    
    func PwdSecure() {
        facebookPwd.isSecureTextEntry = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PwdSecure()
        
    }
    
    
}
