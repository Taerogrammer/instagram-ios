//
//  CommentViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit

class CommentViewController : UIViewController {
    
    @IBOutlet weak var userNameBtn : UIButton!
    @IBOutlet weak var contentLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackAndDM()
        contentField()
        

        
    }
    
    
    
    func BackAndDM() {
        title = "댓글"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        let dmImage = UIImage(named: "home_dm")!
        let dmButton = UIButton(frame: CGRect(x: 0, y: 0, width: dmImage.size.width, height: dmImage.size.height))
        dmButton.setImage(dmImage, for: .normal)
        dmButton.addTarget(self, action: #selector(onClickDm), for: .touchUpInside)
        
        let barDmButton = UIBarButtonItem(customView: dmButton)
        
        self.navigationItem.leftBarButtonItem = barBackButton
        self.navigationItem.rightBarButtonItem = barDmButton
    }
    
    @objc func onClickDm() {
        print("DM clicked")
    }
    
    //MARK: 게시글 내용
    func contentField() {
        contentLbl.text = "크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크"
        contentLbl.numberOfLines = 0
        let newSize = contentLbl.sizeThatFits(CGSize(width: view.frame.width, height: CGFloat.greatestFiniteMagnitude))
        userNameBtn.setTitle("userName 이름!", for: .normal)
        userNameBtn.setTitleColor(.black, for: .normal)
        userNameBtn.addTarget(self, action: #selector(onClickProfile), for: .touchUpInside)
        
        
    }
    
    
    
    @objc func onClickProfile() {
        let otherProfileVC = storyboard?.instantiateViewController(withIdentifier: "OtherProfileViewController") as! OtherProfileViewController
        self.navigationController?.pushViewController(otherProfileVC, animated: true)
        
    }
    
    
    
}
