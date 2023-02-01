//
//  ProfileModalViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class ProfileModalViewController : UIViewController, UISheetPresentationControllerDelegate {
    
    @IBOutlet weak var modalTableView : UITableView!
    
    weak var delegate: SettingModalProtocol?
    weak var activityDelegate: ActivityModalProtocol?
    weak var keepDelegate: KeepModalProtocol?
    weak var QRDelegate: QRModalProtocol?
    weak var saveDelegate: SavedModalProtocol?
    weak var digitalDelegate: DigitalModalProtocol?
    weak var bestFriendDelegate: BestFriendsModalProtocol?
    weak var favoriteDelegate: FavoriteModalProtocol?
    
    var rootView: ProfileNavigationBarViewController?

    
    let menuList = ["설정", "내 활동", "보관", "QR 코드", "저장됨", "디지털 자산", "친한 친구", "즐겨찾기"]
    let imageArray: Array<UIImage> = [UIImage(named:"menu1" )!, UIImage(named: "menu2")!, UIImage(named:"menu3")!, UIImage(named: "menu4")!, UIImage(named: "menu5")!, UIImage(named: "menu6")!, UIImage(named: "menu7")!, UIImage(named: "menu8")!]
    
    

    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sheetPresentationController.delegate = self
        modalSetting()
        
        modalTableView.delegate = self
        modalTableView.dataSource = self
    }
    
    
    //MARK: modal 크기 퍼센트
    func modalSetting() {
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.preferredCornerRadius = 20

        sheetPresentationController.detents = [
            .custom { context in
                return context.maximumDetentValue * 0.8
            }
        ]
    }
    
    
    
    
    
}


extension ProfileModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModalTableViewCell", for: indexPath) as! ModalTableViewCell
        cell.modalImg.image = imageArray[indexPath.row]
        cell.modalName.text = menuList[indexPath.row]
        cell.modalName.font = .NotoSans(.medium, size: 14)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            delegate?.deliverySetting()
            self.dismiss(animated: true, completion: nil)

        case 1:

            activityDelegate?.activitySetting()
            self.dismiss(animated: true, completion: nil)
            print("내 활동 clicked")
        case 2:

            keepDelegate?.keepSetting()
            self.dismiss(animated: true, completion: nil)
            print("보관함")
        case 3:

            QRDelegate?.QRSetting()
            self.dismiss(animated: true, completion: nil)
            print("QR code")
        case 4:

            saveDelegate?.saveSetting()
            self.dismiss(animated: true, completion: nil)
            print("저장됨")
        case 5:

            digitalDelegate?.digitalSetting()
            self.dismiss(animated: true, completion: nil)
            print("디지털 자산")
        case 6:

            bestFriendDelegate?.bestFriendsSetting()
            self.dismiss(animated: true, completion: nil)
            print("친한 친구")
        case 7:

            favoriteDelegate?.favoriteSetting()
            self.dismiss(animated: true, completion: nil)
            print("즐겨찾기")

        default:
            print("default clicked")
        }


        
    }

}

//MARK: protocol
protocol SettingModalProtocol: class {
    func deliverySetting()
}

protocol ActivityModalProtocol: class {
    func activitySetting()
}

protocol KeepModalProtocol: class {
    func keepSetting()
}

protocol QRModalProtocol: class {
    func QRSetting()
}

protocol SavedModalProtocol: class {
    func saveSetting()
}

protocol DigitalModalProtocol: class {
    func digitalSetting()
}

protocol BestFriendsModalProtocol: class {
    func bestFriendsSetting()
}

protocol FavoriteModalProtocol: class {
    func favoriteSetting()
}
