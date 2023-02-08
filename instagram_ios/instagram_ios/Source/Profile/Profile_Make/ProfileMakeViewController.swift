//
//  ProfileMakeViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import Foundation
import UIKit
import YPImagePicker

class ProfileMakeViewController : UIViewController, UISheetPresentationControllerDelegate {
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    weak var reelsDelegate: ReelsProtocol?
    weak var contentsDelegate: ContentsProtocol?
    weak var storyDelegate: StoryProtocol?
    weak var highlightDelegate: HighlightProtocol?
    weak var liveDelegate: LiveProtocol?
    weak var guideDelegate: GuideProtocol?
    
    
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var makeTableView : UITableView!
    
    let makeList = ["릴스", "게시물", "스토리", "스토리 하이라이트", "라이브 방송", "가이드"]
    let imageArray: Array<UIImage> = [UIImage(named: "make_reels")!, UIImage(named: "make_contents")!, UIImage(named: "make_story")!, UIImage(named: "make_highlight")!, UIImage(named: "make_live")!, UIImage(named: "make_guide")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sheetPresentationController.delegate = self
        makeTableView.delegate = self
        makeTableView.dataSource = self
        modalSetting()
        
        topView.layer.addBorder([.bottom], color: .gray, width: 1)
        
    }
    
    func modalSetting() {
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.preferredCornerRadius = 20
        sheetPresentationController.detents = [ .medium()]
    }
    
    
    
}


extension ProfileMakeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakeTableViewCell", for: indexPath) as! MakeTableViewCell
        cell.makeImage.image = imageArray[indexPath.row]
        cell.makeName.text = makeList[indexPath.row]
        cell.makeName.font = .NotoSans(.medium, size: 14)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            reelsDelegate?.reelsSetting()
            self.dismiss(animated: true, completion: nil)

        case 1:

            contentsDelegate?.contentsSetting()
            self.dismiss(animated: true, completion: nil)
            print("내 활동 clicked")
        case 2:
            storyDelegate?.storySetting()
            self.dismiss(animated: true, completion: nil)
            print("스토리")
        case 3:

            highlightDelegate?.highlightSetting()
            self.dismiss(animated: true, completion: nil)
            print("QR code")
        case 4:

            liveDelegate?.liveSetting()
            self.dismiss(animated: true, completion: nil)
            print("저장됨")
        case 5:
            guideDelegate?.guideSetting()
            self.dismiss(animated: true, completion: nil)
            print("디지털 자산")

        default:
            print("default clicked")
        }
    }

    
    
    

}




//MARK: Protocol
protocol ReelsProtocol: class {
    func reelsSetting()
}
protocol ContentsProtocol: class {
    func contentsSetting()
}
protocol StoryProtocol: class {
    func storySetting()
}
protocol HighlightProtocol: class {
    func highlightSetting()
}
protocol LiveProtocol: class {
    func liveSetting()
}
protocol GuideProtocol: class {
    func guideSetting()
}

