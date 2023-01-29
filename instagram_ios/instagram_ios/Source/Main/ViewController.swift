//
//  ViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationBarSetting()
    }
    
    //MARK: navigationbar setting
    func navigationBarSetting() {
        let addImage = UIImage(named: "home_add")!

        let addButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: addImage.size.width,
            height: addImage.size.height))
        addButton.setImage(addImage, for: .normal)
        

        addButton.addTarget(
            self,
            action: #selector(self.onclickAdd(_:)),
            for: .touchUpInside
        )
        

        let barAddButton = UIBarButtonItem(customView: addButton)

        
        let likeImage = UIImage(named: "home_like")!

        let likeButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: likeImage.size.width,
            height: likeImage.size.height))
        likeButton.setImage(likeImage, for: .normal)
        likeButton.addTarget(self, action: #selector(onclickLike), for: .touchUpInside)
        

        let barLikeButton = UIBarButtonItem(customView: likeButton)
        
        let dmImage = UIImage(named: "home_dm")!

        let dmButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: dmImage.size.width,
            height: dmImage.size.height))
        dmButton.setImage(dmImage, for: .normal)
        dmButton.addTarget(self, action: #selector(onClickDM), for: .touchUpInside)
        

        let barDmButton = UIBarButtonItem(customView: dmButton)
        

        
        let instaImage = UIImage(named: "home_instagram")!

        let instaBtn = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: instaImage.size.width,
            height: instaImage.size.height))

        instaBtn.setImage(instaImage, for: .normal)
        instaBtn.addTarget(self, action: #selector(onClickInstagram), for: .touchUpInside)


        let instaButton = UIBarButtonItem(customView: instaBtn)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        spacer.width = 28

        self.navigationItem.leftBarButtonItem = instaButton
        self.navigationItem.rightBarButtonItems = [barDmButton, spacer, barLikeButton, spacer, barAddButton]
    }
    
    @objc func onclickAdd(_ sender: AnyObject) {
        // ...
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigation") as! SideMenuNavigation
//        self.navigationController?.show(pushVC, sender: self)
        print("onClickAdd() success")
    }
    
    //다른 vc으로 이동하기
    @objc func onclickLike(_ sender: AnyObject) {
        
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AlarmViewController")
//        self.navigationController?.pushViewController(pushVC!, animated: true)
        print("onclickLike() success")

        
    }
    
    @objc func onClickInstagram(_ sender: AnyObject) {
        
//        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController")
//
//        modalVC?.modalPresentationStyle = .pageSheet
//        self.present(modalVC!, animated: true, completion: nil)
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
//        self.navigationController?.popViewController(animated: true)
        
        
        print("onclickInstagram()")
        
    }
    @objc func onClickDM(_ sender: AnyObject) {
        
//        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController")
//
//        modalVC?.modalPresentationStyle = .pageSheet
//        self.present(modalVC!, animated: true, completion: nil)
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
//        self.navigationController?.popViewController(animated: true)
        
        
        print("onclickDM")
        
    }
    
    


}

