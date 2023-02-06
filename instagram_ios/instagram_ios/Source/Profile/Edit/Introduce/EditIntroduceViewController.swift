//
//  IntroduceViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditIntroduceViewController : UIViewController {
    
    let singleton = EditSingleton.shared
    
    @IBOutlet weak var introduceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBack()
        NavigationPost()
        title = "소개"
    }
    
    
    func NavigationPost() {
        let postBtn = UIButton()
        postBtn.setTitle("완료", for: .normal)
        postBtn.setTitleColor(.black, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPost), for: .touchUpInside)
        let postButton = UIBarButtonItem(customView: postBtn)
        self.navigationItem.rightBarButtonItem = postButton
    }
    
    @objc func onClickPost() {
        singleton.bio = ""
        singleton.bio = introduceTextField.text ?? ""
        self.navigationController?.popViewController(animated: true)
    }
}
