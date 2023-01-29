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
    
    
    //MARK: modal
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
        let segueIdentifier: String
        switch indexPath.row {
        case 0: //For "one"
//             segueIdentifier = "showView1"
//            self.modalPresentationStyle = .fullScreen
            print("설정 clicked")
            
//            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "firstVC")
//            vcName?.modalPresentationStyle = .fullScreen
//            vcName?.modalTransitionStyle = .coverVertical
//            self.navigationController?.pushViewController(vcName!, animated: true)
//            self.present(vcName!, animated: true, completion: nil)
            
        case 1: //For "two"
             segueIdentifier = "showView2"
        default: //For "three"
             segueIdentifier = "showView3"
        }
//        self.performSegue(withIdentifier: segueIdentifier, sender: self)

        
    }
    
    
    
}
