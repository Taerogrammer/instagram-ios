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
        let buttonImage1 = UIImage(named: "home_add")!

        let button1 = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: buttonImage1.size.width,
            height: buttonImage1.size.height))
        button1.setImage(buttonImage1, for: .normal)
        

        button1.addTarget(
            self,
            action: #selector(self.onclickSideMenu(_:)),
            for: .touchUpInside
        )
        

        let barbuttonItem1 = UIBarButtonItem(customView: button1)

        
        let buttonImage2 = UIImage(named: "home_like")!

        let button2 = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: buttonImage2.size.width,
            height: buttonImage2.size.height))
        button2.setImage(buttonImage2, for: .normal)
        button2.addTarget(self, action: #selector(onclickPopcorn), for: .touchUpInside)
        

        let barbuttonItem2 = UIBarButtonItem(customView: button2)
        
        let buttonImage3 = UIImage(named: "home_dm")!

        let button3 = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: buttonImage3.size.width,
            height: buttonImage3.size.height))
        button3.setImage(buttonImage3, for: .normal)
        

        let barbuttonItem3 = UIBarButtonItem(customView: button3)
        

        
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
        self.navigationItem.rightBarButtonItems = [barbuttonItem3, spacer, barbuttonItem2, spacer, barbuttonItem1]
    }
    
    @objc func onclickSideMenu(_ sender: AnyObject) {
        // ...
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigation") as! SideMenuNavigation
//        self.navigationController?.show(pushVC, sender: self)
    }
    
    //다른 vc으로 이동하기
    @objc func onclickPopcorn(_ sender: AnyObject) {
        
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "AlarmViewController")
//        self.navigationController?.pushViewController(pushVC!, animated: true)
        print("onclickPopcorn")

        
    }
    
    @objc func onClickInstagram(_ sender: AnyObject) {
        
//        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController")
//
//        modalVC?.modalPresentationStyle = .pageSheet
//        self.present(modalVC!, animated: true, completion: nil)
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
//        self.navigationController?.popViewController(animated: true)
        
        
        print("onClickBack")
        
    }
    


}

