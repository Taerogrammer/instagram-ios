//
//  AddLinkViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class AddLinkViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackAndPost()
        title = "링크 추가"
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

    
    
    
}
