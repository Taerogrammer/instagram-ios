//
//  CommentViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit

class CommentViewController : UIViewController {
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var testLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackAndDM()
        contentField()
        
        //MARK: 이미지
        self.view.addSubview(self.thumbnailView)
        self.thumbnailView.snp.makeConstraints { make in
            make.top.equalTo(userNameLbl)
            make.size.width.height.equalTo(40)
        }
        userNameLbl.snp.makeConstraints { make in
            make.left.equalTo(thumbnailView.snp.right)
        }
        
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
        testLbl.text = "크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크크크크크킄크"
        testLbl.numberOfLines = 0
        let newSize = testLbl.sizeThatFits(CGSize(width: view.frame.width, height: CGFloat.greatestFiniteMagnitude))
        userNameLbl.text = "rla_xogud"
    }
    
    //MARK: 비동기 처리 수행 해줘야함
    private let thumbnailView = ThumbnailView().then {
        var profileUrl = URL(string: "https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E")
        var data = try? Data(contentsOf: profileUrl!)
        $0.image = UIImage(data: data!)
//      $0.shouldShowGreenDot = false
    }
    
    
    
}
