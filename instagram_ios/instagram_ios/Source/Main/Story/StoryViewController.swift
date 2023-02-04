//
//  StoryViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

import Foundation
import UIKit

class StoryViewController : UIViewController {
    
    var imagePassed: String = ""
    @IBOutlet weak var storyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyImage.image = UIImage(named: imagePassed)

//        imageSetting()
        
    }
    
//    func imageSetting() {
//        storyImage.image = UIImage(named: imagePassed)
//        storyImage.layer.cornerRadius = storyImage.frame.height / 2
//        storyImage.layer.borderWidth = 1
//        storyImage.setGradient(color1: UIColor.red, color2: .systemPink, color3: .yellow)
//        storyImage.clipsToBounds = true
//
//    }
    

    
    
    
}
