//
//  ProfileViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit


class ProfileViewController : UIViewController {
 
    @IBOutlet weak var highlightView : UIView!
    @IBOutlet weak var feedView : UIView!
    @IBOutlet weak var storyHighlight: NSLayoutConstraint!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var myFeedView : UIView!
    @IBOutlet weak var tagFeedView : UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    var countHighlight: Int = 0
    
    let singleton = LoginSingleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(LoginSingleton.shared)
        print("ProfileVC load")
        DispatchQueue.main.async {
            self.HighlightOnOff()
        }

        
        defaultSeg()
        segmentedControl.addUnderlineForSelectedSegment()
        fontSetting()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        print("\(singleton.jwt)")
        print("\(singleton.userIdx)")
    }
    
    //MARK: story highlight 유무
    func HighlightOnOff() {
        if countHighlight == 0 {
            highlightView.isHidden = true
            storyHighlight.constant = 0 - highlightView.frame.height
        }
        else {
            highlightView.isHidden = false
        }

    }

    //MARK: segment control
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myFeedView.isHidden = false
            tagFeedView.isHidden = true
        }
        else {
            myFeedView.isHidden = true
            tagFeedView.isHidden = false
        }
    }
    func defaultSeg() {
        myFeedView.isHidden = false
        tagFeedView.isHidden = true
        
        let backgroundImage = UIImage()
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        
    }
    @IBAction func segmentedControlUnderLine(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
    }
    @IBAction func editProfile(_ sender: AnyObject) {
        let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    func fontSetting() {
        nameLbl.font = .NotoSans(.bold, size: 16)
        introduceLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.textColor = .systemBlue
    }
    

    //MARK: 이름, 소개글, 링크 유무에 따라 view 올리고 내리기 --> 나중에 데이터 들어오면 구현
    
    
    
    
    func getLogin() {
        print()
    }
    

}

