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

    
    var countHighlight: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ProfileVC load")
        DispatchQueue.main.async {
            self.HighlightOnOff()
        }
    }
    
    
    func HighlightOnOff() {
        if countHighlight == 0 {
            highlightView.isHidden = true
            storyHighlight.constant = 0 - highlightView.frame.height
        }
        else {
            highlightView.isHidden = false
        }

    }

}
