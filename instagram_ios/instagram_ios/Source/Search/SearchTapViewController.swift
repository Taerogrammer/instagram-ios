//
//  SearchTapViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit

class SearchTapViewController: UIViewController {
    
    @IBOutlet weak var designImage: UIImageView!
    var imagePassed: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designImage.image = UIImage(named: imagePassed)
        backNavigationSetting()
    }
    
    
    
    
    func backNavigationSetting() {
        title = "탐색 탭"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.leftBarButtonItem = barBackButton
    }
    
    
    //MARK: button custom

    
    
}
