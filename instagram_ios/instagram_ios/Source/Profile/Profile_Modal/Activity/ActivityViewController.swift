//
//  ActivityViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class ActivityViewController : UIViewController {
    
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var picButton : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
        description()
        viewBorder()
        buttonBorder()
    }
    
    //MARK: navigation bar
    func navibar() {
        title = "내 활동"
        let instaImage = UIImage(named: "backBtn")!

        let instaBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: instaImage.size.width,
            height: instaImage.size.height))

        instaBtn.setImage(instaImage, for: .normal)
        instaBtn.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)


        let instaButton = UIBarButtonItem(customView: instaBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = instaButton
    }

    //MARK: 처음 설명
    func description() {
        titleLbl.text = "한곳에서 모든 활동을 관리해보세요"
        titleLbl.font = .NotoSans(.bold, size: 32)
        infoLbl.text = "Instgram에서 회원님의 사진, 동영상, 계정 및 활동을 검토하고 관리할 수 있는 도구가 추가되었습니다."
        infoLbl.font = .NotoSans(.medium, size: 15)
        infoLbl.tintColor = .systemGray6
    }
    
    func viewBorder() {
        topView.layer.addBorder([.top, .bottom], color: .gray, width: 0.5)
    }
    
    func buttonBorder() {
        timeButton.layer.borderWidth = 8
        timeButton.layer.borderColor = CGColor(gray: 1, alpha: 0.8)
    }
    
    
}
