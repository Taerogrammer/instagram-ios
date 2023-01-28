//
//  SearchBarViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import Foundation
import UIKit

class SearchNavigationBarViewController : UIViewController {
    
    private let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetting()
    }
    
    //MARK: Navigation Bar
    func navigationBarSetting() {
        navigationController?.hidesBarsOnSwipe = true
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "검색"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .black
        navigationItem.titleView = searchController.searchBar
    }
    
}
