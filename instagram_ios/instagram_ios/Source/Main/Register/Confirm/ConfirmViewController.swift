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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.tintColor = .facebook_check
    }
    
}
