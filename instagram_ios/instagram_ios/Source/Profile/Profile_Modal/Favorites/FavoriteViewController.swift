//
//  FavoriteViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/31.
//

import Foundation
import UIKit

class FavoriteViewController : UIViewController {
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var modalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navibar()
        descriptionSetting()
        SeeLogic()
        searchBarForFav()
        
        
    }
    
    
    
    //MARK: navigation bar
    func navibar() {
        title = "즐겨찾기"
        let closeImage = UIImage(named: "closeBtn")!

        let closeBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: closeImage.size.width,
            height: closeImage.size.height))
        closeBtn.setImage(closeImage, for: .normal)
        closeBtn.addTarget(self, action: #selector(onClickClose), for: .touchUpInside)
        let closeButton = UIBarButtonItem(customView: closeBtn)
        
        let plusImage = UIImage(named: "plusBtn")!
        let plusBtn = UIButton(frame: CGRect(x: 0, y: 0, width: plusImage.size.width, height: plusImage.size.height))
        plusBtn.setImage(plusImage, for: .normal)
        plusBtn.addTarget(self, action: #selector(onClickSearch), for: .touchUpInside)
        let plusButton = UIBarButtonItem(customView: plusBtn)
        
        self.navigationItem.leftBarButtonItem = closeButton
        self.navigationItem.rightBarButtonItem = plusButton

    }
    @objc func onClickClose() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func onClickSearch() {
        print("Plus 버튼 클릭")
    }
    
    //MARK: description
    func descriptionSetting() {
        descriptionLbl.text = "즐겨찾기 계정이 새 게시물은 피드 상단에 표시됩니다. 회원님이 추가하거나 삭제한 사람은 회원님만 볼 수 있습니다."
        descriptionLbl.font = .NotoSans(.medium, size: 14)
        descriptionLbl.textColor = .gray
    }
    
    //MARK: tip
    func SeeLogic() {
        modalButton.setTitle("원리 알아보기.", for: .normal)
        modalButton.titleLabel?.font = .NotoSans(.bold, size: 12)
        modalButton.titleLabel?.textColor = .systemBlue
    }
    
    //MARK: search bar
    func searchBarForFav() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.searchBar.setValue("완료", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .black
        
        self.navigationItem.searchController = searchController
    }
    
    //MARK: modal
    @IBAction func presentModal() {
        let sheetPresentationController = self.storyboard?.instantiateViewController(withIdentifier: "FavDescriptionViewController") as! FavDescriptionViewController
        
        self.present(sheetPresentationController, animated: true)
        
    }
    
}
