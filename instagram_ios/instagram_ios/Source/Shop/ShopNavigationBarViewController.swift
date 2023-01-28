//
//  ShopNavigationBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class ShopNavigationBarViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "TCO_choose_reminder"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
    }
    
    
    
}
