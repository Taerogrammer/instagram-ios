//
//  FollowListViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/05.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class FollowListViewController: TabmanViewController {
    
    private var viewControllers: Array <UIViewController> = []
    @IBOutlet weak var tempView: UIView!
//    let story = UIStoryboard(name: "FollowListViewController", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let followerVC = UIStoryboard.init(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "FollowerViewController") as! FollowerViewController
        let followeeVC = UIStoryboard.init(name: "ProfileViewController", bundle: nil).instantiateViewController(withIdentifier: "FolloweeViewController") as! FolloweeViewController
        viewControllers.append(followerVC)
        viewControllers.append(followeeVC)
        
        
        
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .regular)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        bar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .black
        }
        bar.indicator.weight = .custom(value: 1)
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 0
        bar.layout.transitionStyle = .snap
        
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
    }
    
    
    
    
}

extension FollowListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "팔로워")
        default:
            return TMBarItem(title: "팔로잉")
        }
        
    }
    
    
}
