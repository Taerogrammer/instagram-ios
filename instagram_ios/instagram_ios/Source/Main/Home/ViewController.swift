//
//  ViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/28.
//

import UIKit
import YPImagePicker
import FirebaseStorage
import Alamofire

class ViewController: UIViewController {

    var storyPhoto: [String] = ["menu1","menu2","menu3","menu4","tip1","tip2","tip3","fav1","facebook_logo","facebook_logo_black","like_check","like_uncheck"]
    var userName: [String] = ["user1","user2","user3","user4","user5","user6","tip3","fav1","facebook_logo","facebook_logo_black","like_check","like_uncheck"]
    
    var userInfo: [HomeUserResult] = []
    
    var feedImages: [String] = []
    
    var images: [UIImage] = []

    let defaultUrl = URL(string: "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!
    
    
    @IBOutlet weak var storyCollectionView : UICollectionView!
    @IBOutlet weak var feedCollectionView : UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let storage = Storage.storage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarSetting()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
  
        
        pageControl.currentPage = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getUserInfo()
        }
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
    
    
    func getUserInfo() {
        AF.request("\(Constant.Base_URL)/app/users/following-posts", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: HomeUserResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("USER INFO SUCCESS >>> \(response)")
                                
                DispatchQueue.main.async {
                    self.userInfo = response.result
                    self.feedCollectionView.reloadData()
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func onclickAdd(_ sender: AnyObject) {
        var config = YPImagePickerConfiguration()
        config.startOnScreen = .library
        config.screens = [.library, .photo, .video]
        config.library.maxNumberOfItems = 10
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, cancelled in
            self.images = []

            if cancelled == true {
                picker.dismiss(animated: true, completion: nil)
            }
            else {
                for item in items {
                    switch item {
                    case.photo(let photo):
                        self.images.append(photo.image)
                    default:
                        print("Photo가 아님")
                    }
                }
                print(self.images)
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MakePostViewController") as? MakePostViewController else { return }
                vc.selectedImages = self.images
                picker.dismiss(animated: true)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        present(picker, animated: true)
    }
    
    @objc func uploadPhoto() {
        print("Upload complete")
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
            
            return userInfo.count
        }

    }
    

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
            feedCell.topUserNameBtn.setTitle(userInfo[indexPath.row].userName, for: .normal)
            feedCell.topUserNameBtn.setTitleColor(.black, for: .normal)
            feedCell.topUserNameBtn.contentHorizontalAlignment = .left
            feedCell.likeLbl.text = "좋아요 " + "\(userInfo[indexPath.row].likeCount)" + "개"
            feedCell.userNameLbl.text = "\(userInfo[indexPath.row].userName)"
            feedCell.userNameLbl.font = .NotoSans(.bold, size: 16)
            feedCell.contentsLbl.text = "\(userInfo[indexPath.row].content!)"
            feedCell.contentsLbl.font = .NotoSans(.medium, size: 16)
            feedCell.commentAllLbl.setTitle("댓글 " + "\(userInfo[indexPath.row].commentCount)" + "개 보기", for: .normal)
            feedCell.postDataLbl.text = "\(userInfo[indexPath.row].dayInfo!.month)" + "월 " + "\(userInfo[indexPath.row].dayInfo!.day)" + "일"
            
            feedCell.profileImage.load(url: URL(string: userInfo[indexPath.row].userProfileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
            
            feedImages = userInfo[indexPath.row].imgUrls
            pageControl.numberOfPages = userInfo[indexPath.row].imgUrls.count
            
            print("페이지 컨트롤 : \(pageControl.numberOfPages)")
            
            feedCell.contentImages.load(url: URL(string: userInfo[indexPath.row].imgUrls[0])!)
            
            
            
            return feedCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == storyCollectionView {
            switch indexPath.row {
            case 0:
                print("스토리 첫 번째 셀 clicked")
            case 1:
                print("스토리 두 번째 셀 clicked")
            default:
                print("이건 error일듯")
            }
            let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
            storyVC.imagePassed = storyPhoto[indexPath.row]
            self.navigationController?.pushViewController(storyVC, animated: true)
            
        }
        else {      //feed collection view
            switch indexPath.row {
            case 0:
                print("첫 번째 피드 click")
            case 1:
                print("두 번째 피드 click")
            case 2:
                print("세 번째 피드 click")
            default:
                print("나머지 피즈 clicked")
            }
//            let feedVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
//            self.navigationController?.pushViewController(feedVC, animated: true)
            
            
        }

        
        
        
//        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
//        storyVC.imagePassed = storyPhoto[indexPath.row]
//        self.navigationController?.pushViewController(storyVC, animated: true)
    }

}

