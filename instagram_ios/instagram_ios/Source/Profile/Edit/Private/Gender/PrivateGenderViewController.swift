//
//  PrivateGenderViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivateGenderViewController : UIViewController {
    
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnSelf: UIButton!
    @IBOutlet weak var btnNoShow: UIButton!
    @IBOutlet weak var bySelfHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    @IBOutlet weak var textFieldView: UIView!
    @IBAction func btnSelectGender(_ sender: UIButton) {
        if sender == btnMale {
            btnMale.isSelected = true
            btnFemale.isSelected = false
            btnSelf.isSelected = false
            btnNoShow.isSelected = false
            textFieldView.isHidden = true
            bySelfHeight.constant = 0 - textFieldView.frame.height
            buttonHeight.constant = 0 - textFieldView.frame.height
        }
        else if sender == btnFemale {
            btnMale.isSelected = false
            btnFemale.isSelected = true
            btnSelf.isSelected = false
            btnNoShow.isSelected = false
            textFieldView.isHidden = true
            bySelfHeight.constant = 0 - textFieldView.frame.height
            buttonHeight.constant = 0 - textFieldView.frame.height
        }
        else if sender == btnSelf {     //직접 지정 text field도 나타나야 함
            btnMale.isSelected = false
            btnFemale.isSelected = false
            btnSelf.isSelected = true
            btnNoShow.isSelected = false
            
            textFieldView.isHidden = false
            bySelfHeight.constant = 15
            buttonHeight.constant = 15
        }
        else {
            btnMale.isSelected = false
            btnFemale.isSelected = false
            btnSelf.isSelected = false
            btnNoShow.isSelected = true
            textFieldView.isHidden = true
            bySelfHeight.constant = 0 - textFieldView.frame.height
            buttonHeight.constant = 0 - textFieldView.frame.height
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButton()
        
        textFieldView.isHidden = true
        bySelfHeight.constant = 0 - textFieldView.frame.height
        buttonHeight.constant = 0 - textFieldView.frame.height
        NavigationBack()
        NavigationPost()
        title = "성별"
        
    }
    
    
    
    //MARK: radio button setting
    func radioButton() {
        btnMale.setImage(UIImage.init(named: "radio_uncheck"), for:  .normal)
        btnMale.setImage(UIImage.init(named: "radio_check"), for:  .selected)
        btnFemale.setImage(UIImage.init(named: "radio_uncheck"), for:  .normal)
        btnFemale.setImage(UIImage.init(named: "radio_check"), for:  .selected)
        btnSelf.setImage(UIImage.init(named: "radio_uncheck"), for:  .normal)
        btnSelf.setImage(UIImage.init(named: "radio_check"), for:  .selected)
        btnNoShow.setImage(UIImage.init(named: "radio_uncheck"), for:  .normal)
        btnNoShow.setImage(UIImage.init(named: "radio_check"), for:  .selected)
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
        print("성별 포스트 완료")
    }
    
    
}
