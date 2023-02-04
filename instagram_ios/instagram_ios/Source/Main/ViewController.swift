//
//  ViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import UIKit

class ViewController: UIViewController {

    var storyPhoto: [String] = ["menu1","menu2","menu3","menu4","tip1","tip2","tip3","fav1","facebook_logo","facebook_logo_black","like_check","like_uncheck"]
    var userName: [String] = ["user1","user2","user3","user4","user5","user6","tip3","fav1","facebook_logo","facebook_logo_black","like_check","like_uncheck"]
    
    var userFeed: [Feed] = [
        Feed(userImage: "facebook_logo", userName: "user1", images: ["menu1", "menu2", ",menu3"], likeNumber: 4, content: "안녕여여영영", commentNumber: 6, postData: "2023년 2월 4일"),
        Feed(userImage: "tip3", userName: "user22222", images: ["menu1", "menu2", ",menu3"], likeNumber: 6, content: "asdasas", commentNumber: 6, postData: "2023년 2월 4일"),
        Feed(userImage: "fav1", userName: "user3333333", images: ["menu1", "menu2", ",menu3"], likeNumber: 6, content: "asdqwdqwqwf", commentNumber: 7, postData: "2023년 2월 4일")
    ]
    
    
    
    @IBOutlet weak var storyCollectionView : UICollectionView!
    @IBOutlet weak var feedCollectionView : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController")
        self.navigationController?.pushViewController(pushVC!, animated: true)
        print("onclickLike() success")

        
    }
    
    @objc func onClickInstagram(_ sender: AnyObject) {

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




extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return storyPhoto.count
        }
        else {
            return userFeed.count
        }

//        return storyPhoto.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == feedCollectionView {
//
//        }
//
//    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storyCollectionView {
            guard let storyCell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as? StoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            storyCell.storyImage.image = UIImage(named: storyPhoto[indexPath.row])
            storyCell.storyUserName.text = userName[indexPath.row]
            return storyCell
        }
        else  {
            guard let feedCell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as? FeedCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            //프사 없음!!!!!!
            feedCell.userNameLbl.text = userFeed[indexPath.row].userName
            feedCell.contentImages.image = UIImage(named: userFeed[indexPath.row].userImage)    //일단은 유저 프사로
            
//            let newWidth = 180
//            let newHeight = 180
//            let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
//            UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//            feedCell.contentImages.image?.draw(in: newImageRect)
            
            
            
            
            feedCell.contentsLbl.text = userFeed[indexPath.row].content
            feedCell.commentAllLbl.setTitle("댓글 \(userFeed[indexPath.row].commentNumber)개 모두 보기", for: .normal)
            feedCell.postDataLbl.text = userFeed[indexPath.row].postData
            return feedCell
        }
//        let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! StoryCollectionViewCell
//        cell.storyImage.image = UIImage(named: storyPhoto[indexPath.row])
//        cell.storyUserName.text = userName[indexPath.row]
//
//        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("첫 번째 셀 clicked")
        case 1:
            print("두 번째 셀 clicked")
        default:
            print("이건 error일듯")
        }
        
        
        
//        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
//        storyVC.imagePassed = storyPhoto[indexPath.row]
//        self.navigationController?.pushViewController(storyVC, animated: true)
    }

}


struct Feed {
    var userImage: String
    var userName: String
    var images: Array<String>
    var likeNumber : Int
    var content: String
    var commentNumber: Int
    var postData: String
}
