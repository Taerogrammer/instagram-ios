//
//  UIButton.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import UIKit

// MARK: UIButton 내에 Indicator 표시
extension UIButton {
    func showIndicator() {
        let indicator = UIActivityIndicatorView()
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func dismissIndicator() {
        for view in self.subviews {
            if let indicator = view as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
}

//MARK: Radio Button
class RadioButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initButton()
    }
    
    func initButton() {
        self.backgroundColor = .clear
        self.tintColor = .clear
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "radio_uncheck")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.setImage(UIImage(named: "radio_check")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        self.setImage(UIImage(named: "radio_check")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
}

