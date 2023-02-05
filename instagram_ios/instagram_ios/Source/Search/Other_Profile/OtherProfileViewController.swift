//
//  OtherProfileViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/05.
//

import Foundation
import UIKit

class OtherProfileViewController : UIViewController {
    
    
    @IBOutlet weak var segmentedControl : UISegmentedControl!
    @IBOutlet weak var myFeedView : UIView!
    @IBOutlet weak var tagFeedView : UIView!
    
    @IBOutlet weak var highlightView : UIView!
    @IBOutlet weak var feedView : UIView!
    
    @IBOutlet weak var storyHighlight: NSLayoutConstraint!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var introduceLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSeg()
        fontSetting()
        DispatchQueue.main.async {
            self.HighlightOnOff()
        }
        segmentedControl.addUnderlineForSelectedSegment()
        BackAndUserNameTitle()
        
    }
    
    var countHighlight: Int = 0
    
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
    func fontSetting() {
        nameLbl.font = .NotoSans(.bold, size: 16)
        introduceLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.font = .NotoSans(.regular, size: 16)
        linkLbl.textColor = .systemBlue
    }
    
    func BackAndUserNameTitle() {
        title = "userName 넣기"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = barBackButton
    }
    
    
}
