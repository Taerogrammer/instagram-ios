//
//  FavDescriptionViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/01.
//

import Foundation
import UIKit

class FavDescriptionViewController : UIViewController {
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalSetting()
        titleSetting()
    }
    
    //MARK: modal 크기 조정
    func modalSetting() {
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.preferredCornerRadius = 20
        sheetPresentationController.detents = [
            .custom { context in
                return context.maximumDetentValue * 0.7
            }
        ]
    }
    
    
    //MARK: 소개 글
    func titleSetting() {
        titleLbl.text = "즐겨찾기 이용 방법"
        titleLbl.font = .NotoSans(.bold, size: 16)
    }
    
}
