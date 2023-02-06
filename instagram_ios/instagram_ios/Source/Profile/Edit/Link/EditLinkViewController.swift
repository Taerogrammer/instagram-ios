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
        NavigationBack()
        title = "링크"
        NavigationPost()
    }

    
    @IBAction func onClickAddLink(_ sender: AnyObject) {
        let addVC = storyboard?.instantiateViewController(withIdentifier: "AddLinkViewController") as! AddLinkViewController
        self.navigationController?.pushViewController(addVC, animated: true)
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
        print("Edit Link 포스트 완료")
    }
}
