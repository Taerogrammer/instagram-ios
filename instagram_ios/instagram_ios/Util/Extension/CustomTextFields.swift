//
//  CustomTextFields.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class CustomTextFields: UITextField {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUnderlinedTextField()
    }
    
    func setupUnderlinedTextField() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width - 50, height: 1)
        bottomLayer.backgroundColor = UIColor.blue.cgColor
        self.layer.addSublayer(bottomLayer)
    }
}
