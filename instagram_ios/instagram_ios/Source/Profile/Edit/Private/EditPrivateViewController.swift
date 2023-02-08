//
//  PrivateViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class EditPrivateViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
        labelSetting()
        
        print("싱글톤 >> \(singleton.email) \(singleton.phone)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.InfoInButton()
        }
    }
    
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var genderBtn : UIButton!
    @IBOutlet weak var birthdayBtn: UIButton!
    
    let singleton = PrivateSingleton.shared
    
    func navibar() {
        title = "개인정보"

        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: backImage.size.width,
            height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)

        self.navigationItem.leftBarButtonItem = barBackButton
    }

    func labelSetting() {
        textLbl.text = "비즈니스나 반려동물 등을 위한 계정인 경우에도 회원님의 개인정보를 입력하세요. 해당 정보는 공개 프로필에 포함되지 않습니다.\n\n계정 보안 유지를 위해 다른 사람 소유의 이메일 또는 전화번호를 입력하지 마세요."
        textLbl.textColor = .gray
        textLbl.font = .NotoSans(.medium, size: 14)
    }
    
    
    //MARK: button 안에 정보 넣기
    var textEmail: String = "email 받기"
    var textPhone: String = "phone 받기"
    var textGender: String = "gender 받기"
    var textBirthday: String = "birthday 받기"
    
    //MARK: button 안에 정보 넣기
    func InfoInButton() {
        
        if singleton.email != nil && singleton.email != "" {
            emailBtn.setTitle("\(singleton.email!)", for: .normal)
            emailBtn.setTitleColor(.black, for: .normal)
            emailBtn.contentHorizontalAlignment = .left
        }
        else {
            print("nil값 맞음")
            emailBtn.setTitle("\(textEmail)", for: .normal)
            emailBtn.setTitleColor(.gray, for: .normal)
            emailBtn.contentHorizontalAlignment = .left
        }
        
        if singleton.phone != nil && singleton.phone != "" {
            phoneBtn.setTitle("\(singleton.phone!)", for: .normal)
            phoneBtn.setTitleColor(.black, for: .normal)
            phoneBtn.contentHorizontalAlignment = .left
        }
        else {
            print("nil값 맞음")
            phoneBtn.setTitle("\(textPhone)", for: .normal)
            phoneBtn.setTitleColor(.gray, for: .normal)
            phoneBtn.contentHorizontalAlignment = .left
        }
        
        
        
        genderBtn.setTitle("\(textGender)", for: .normal)
        genderBtn.setTitleColor(.gray, for: .normal)
        genderBtn.contentHorizontalAlignment = .left
        birthdayBtn.setTitle("\(textBirthday)", for: .normal)
        birthdayBtn.setTitleColor(.gray, for: .normal)
        birthdayBtn.contentHorizontalAlignment = .left
    }
    //MARK: navigation button
    @IBAction func goToEmail(_ sender: Any) {
        let emailVC = storyboard?.instantiateViewController(withIdentifier: "PrivateEmailViewController") as! PrivateEmailViewController
        self.navigationController?.pushViewController(emailVC, animated: true)
    }
    @IBAction func goToPhone(_ sender: Any) {
        let phoneVC = storyboard?.instantiateViewController(withIdentifier: "PrivatePhoneViewController") as! PrivatePhoneViewController
        self.navigationController?.pushViewController(phoneVC, animated: true)
    }
    @IBAction func goToGender(_ sender: Any) {
        let genderVC = storyboard?.instantiateViewController(withIdentifier: "PrivateGenderViewController") as! PrivateGenderViewController
        self.navigationController?.pushViewController(genderVC, animated: true)
    }
    @IBAction func goToBirthday(_ sender: Any) {
        let birthdayVC = storyboard?.instantiateViewController(withIdentifier: "PrivateBirthdayViewController") as! PrivateBirthdayViewController
        self.navigationController?.pushViewController(birthdayVC, animated: true)
    }
    
}
