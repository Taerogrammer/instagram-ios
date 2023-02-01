//
//  LinkViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditLinkViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackAndPost()
        title = "링크"
    }

    
    @IBAction func onClickAddLink(_ sender: AnyObject) {
        let addVC = storyboard?.instantiateViewController(withIdentifier: "AddLinkViewController") as! AddLinkViewController
        self.navigationController?.pushViewController(addVC, animated: true)
        
        
    }
}
