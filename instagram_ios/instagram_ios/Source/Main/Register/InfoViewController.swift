//
//  InfoViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/30.
//

import Foundation
import UIKit

class InfoViewController : UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var phoneView : UIView!
    @IBOutlet weak var emailView : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        defaultSeg()
        segmentedControl.addUnderlineForSelectedSegment()
        
        let deviderImage = UIImage()
        self.segmentedControl.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 20, weight: .semibold)], for: .normal)
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 20, weight: .semibold)], for: .selected)
        
    }
    
    //MARK: navigation bar
    func navigationBar() {
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
    
    //MARK: segment control
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            phoneView.isHidden = false
            emailView.isHidden = true
        }
        else {
            phoneView.isHidden = true
            emailView.isHidden = false
        }

    }
    func defaultSeg() {
        phoneView.isHidden = false
        emailView.isHidden = true
        
        
        let backgroundImage = UIImage()
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.segmentedControl.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

    }
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl){
            segmentedControl.changeUnderlinePosition()
        }
    
    
}
