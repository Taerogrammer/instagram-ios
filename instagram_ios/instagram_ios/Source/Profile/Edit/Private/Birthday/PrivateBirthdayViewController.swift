//
//  PrivateBirthdayViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class PrivateBirthdayViewController: UIViewController {
    
    @IBOutlet weak var dateTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePicker()
        title = "생일"

        NavigationBack()
        NavigationPost()
        
    }
    
    //MARK: Date Picker
    func DatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        dateTextField.inputView = datePicker
    }
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTextField.text = formatData(date: datePicker.date)
    }
    
    func formatData(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
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
        print("생일 포스트 완료")
    }
    
    
    
}
