//
//  ImageViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/07.
//

import Foundation
import UIKit

class ImageViewController : UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UserDefaults.standard.string(forKey: "url"))
        
        let url = URL(string: UserDefaults.standard.string(forKey: "url")!)
        image.load(url: url!)
    }
    
    
}
