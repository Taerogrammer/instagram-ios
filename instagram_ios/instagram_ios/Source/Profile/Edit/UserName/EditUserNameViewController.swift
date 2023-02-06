//
//  UserNameViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditUserNameViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBack()
        title = "사용자 이름"
        NavigationPost()
        
    }
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    let singleton = EditSingleton.shared
    
    func NavigationPost() {
        let postBtn = UIButton()
        postBtn.setTitle("완료", for: .normal)
        postBtn.setTitleColor(.black, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPost), for: .touchUpInside)
        let postButton = UIBarButtonItem(customView: postBtn)
        self.navigationItem.rightBarButtonItem = postButton
    }
    
    @objc func onClickPost() {
        singleton.userName = ""
        singleton.userName = userNameTextField.text ?? ""
        self.navigationController?.popViewController(animated: true)
        
    }

}
