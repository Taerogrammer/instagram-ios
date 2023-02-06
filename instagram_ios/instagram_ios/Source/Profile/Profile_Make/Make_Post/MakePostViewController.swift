//
//  MakePostViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/06.
//

import Foundation
import UIKit
import YPImagePicker

class MakePostViewController : UIViewController {
    
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var personBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationBack()
        NavigationPost()
        title = "새 게시물"
        ButtonSetting()
        
    }
    
    
    
    func NavigationPost() {
        let postBtn = UIButton()
        postBtn.setTitle("공유", for: .normal)
        postBtn.setTitleColor(.systemBlue, for: .normal)
        postBtn.addTarget(self, action: #selector(onClickPosting), for: .touchUpInside)
        let barPostButton = UIBarButtonItem(customView: postBtn)
        self.navigationItem.rightBarButtonItem = barPostButton
        
    }
    @objc func onClickPosting() {
        
        print("Posting")
    }
    
    func ButtonSetting() {
        personBtn.setTitle("사람 태그하기", for: .normal)
        personBtn.setTitleColor(.black, for: .normal)
        personBtn.contentHorizontalAlignment = .left
        locationBtn.setTitle("위치 추가", for: .normal)
        locationBtn.setTitleColor(.black, for: .normal)
        locationBtn.contentHorizontalAlignment = .left
    }
    
    
    
    
    
}


