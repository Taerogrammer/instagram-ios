//
//  UITextField.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
      func addLeftImage(image:UIImage) {
              let lefIimage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
          lefIimage.image = image
              self.leftView = lefIimage
              self.leftViewMode = .always
          }
}
