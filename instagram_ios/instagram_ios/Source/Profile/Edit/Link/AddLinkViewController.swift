//
//  AddLinkViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class AddLinkViewController: UIViewController {
    
    let singleton = EditSingleton.shared
    
    @IBOutlet weak var linkTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBack()
        title = "링크 추가"
        NavigationPost()
    }
    
    @objc override func onClickBack() {
        
        let alert = UIAlertController(title: "변경 내용을 삭제하시겠어요?", message: "지금 돌아가면 변경 내용이 삭제됩니다.", preferredStyle: UIAlertController.Style.alert)
        let dismiss = UIAlertAction(title: "변경 내용 삭제", style: UIAlertAction.Style.default, handler: { action in
            self.navigationController?.popViewController(animated: true)
            print("POP")
            
        })
        let continueEdit = UIAlertAction(title: "수정 계속하기", style: UIAlertAction.Style.default)
        continueEdit.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(dismiss)
        alert.addAction(continueEdit)
        self.present(alert, animated: true)
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
        singleton.link = ""
        singleton.link = linkTextField.text ?? ""
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
