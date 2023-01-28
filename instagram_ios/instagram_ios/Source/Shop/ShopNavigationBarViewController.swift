//
//  ShopNavigationBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class ShopNavigationBarViewController : UIViewController {
    
    private let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetting()
        
    }
    
    //MARK: Navigation Bar
    func navigationBarSetting() {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "Shop"
        titleLabel.font = .NotoSans(.bold, size: 28)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
        
        
        let wishImage = UIImage(named: "shop_wishlist")!
        let wishButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: wishImage.size.width,
            height: wishImage.size.height))
        wishButton.setImage(wishImage, for: .normal)
        wishButton.addTarget(self, action: #selector(onClickWish), for: .touchUpInside)
        

        let barWisheButton = UIBarButtonItem(customView: wishButton)
        
        let menuImage = UIImage(named: "shop_menu")!

        let menuButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: menuImage.size.width,
            height: menuImage.size.height))
        menuButton.setImage(menuImage, for: .normal)
        menuButton.addTarget(self, action: #selector(onClickMenu), for: .touchUpInside)
        

        let barMenuButton = UIBarButtonItem(customView: menuButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        spacer.width = 28
        
        self.navigationItem.rightBarButtonItems = [barMenuButton, spacer, barWisheButton]
  
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .black
        self.navigationItem.searchController = searchController
        
        //스크롤 해도 서치바 보이게끔
        self.navigationItem.hidesSearchBarWhenScrolling = false

        
    }
    
    @objc func onClickWish() {
        print("onClickWish()")
    }
    @objc func onClickMenu() {
        print("onClickMenu()")
    }
    
    
    
}
