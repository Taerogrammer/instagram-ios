//
//  BestFriendsViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class BestFriendsViewController : UIViewController {
    private let searchController = UISearchController()

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var tipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
        descriptionSetting()
        HowToUse()
        searchBarForBF()
    }
    //MARK: navigation bar
    func navibar() {
        title = "친한 친구"
        let closeImage = UIImage(named: "closeBtn")!

        let closeBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: closeImage.size.width,
            height: closeImage.size.height))
        closeBtn.setImage(closeImage, for: .normal)
        closeBtn.addTarget(self, action: #selector(onClickClose), for: .touchUpInside)
        let closeButton = UIBarButtonItem(customView: closeBtn)
        self.navigationItem.leftBarButtonItem = closeButton

    }
    @objc func onClickClose() {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK: description
    func descriptionSetting() {
        descriptionLbl.text = "친한 친구 리스트를 수정해도 리스트의 친구들에게 알림이 전송되지 않습니다."
        descriptionLbl.font = .NotoSans(.medium, size: 14)
        descriptionLbl.textColor = .gray
    }
    
    //MARK: tip
    func HowToUse() {
        tipButton.setTitle("이용 방법.", for: .normal)
        tipButton.titleLabel?.font = .NotoSans(.medium, size: 12)
        tipButton.titleLabel?.textColor = .facebook_check
    }
    
    //MARK: search bar
    func searchBarForBF() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .black
        
        self.navigationItem.searchController = searchController
    }
 
    //MARK: modal
    
    @IBAction func presentModal() {
        let sheetPresentationController = self.storyboard?.instantiateViewController(withIdentifier: "BFDescriptionViewController") as! BFDescriptionViewController
        
        self.present(sheetPresentationController, animated: true)
        
    }
    
    
}
