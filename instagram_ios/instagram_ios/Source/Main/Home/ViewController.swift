//
//  ViewController.swift
//  instagram_ios
//
//  Created by κΉνν on 2023/01/28.
//

import UIKit
import YPImagePicker
import FirebaseStorage
import Alamofire

class ViewController: UIViewController {

    var storyInfo: [SearchStoryResult] = []
    var userInfo: [HomeUserResult] = []
    
    var feedImages: [String] = []
    
    var images: [UIImage] = []

    let defaultUrl = URL(string: "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!
    
    lazy var postId: Int = 0
    
    @IBOutlet weak var storyCollectionView : UICollectionView!
    @IBOutlet weak var feedCollectionView : UICollectionView!
    
    let storage = Storage.storage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarSetting()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
  
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view will appear")
        DispatchQueue.main.async {
            self.getUserInfo()
            self.getStoryInfo()
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
//                print("USER INFO SUCCESS >>> \(response)")
                
                DispatchQueue.main.async {
                    self.userInfo = response.result
                    self.feedCollectionView.reloadData()

                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getStoryInfo() {
        AF.request("\(Constant.Olive_URL)/app/users/\(UserDefaults.standard.integer(forKey: "userIdx"))/following-stories", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: SearchStoryResponse.self) { response in
            switch response.result {
            case .success(let response):
//                print("USER STORY INFO SUCCESS >>> \(response)")
                
                DispatchQueue.main.async {
                    self.storyInfo = response.result
                    self.storyCollectionView.reloadData()
                }

            case .failure(let error):
                print("ERROR >> \(error)")
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
                        print("Photoκ° μλ")
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
    
    
    
    //λ€λ₯Έ vcμΌλ‘ μ΄λνκΈ°
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
            return storyInfo.count
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
            storyCell.storyImage.load(url: URL(string: storyInfo[indexPath.row].profileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
            storyCell.storyUserName.text = storyInfo[indexPath.row].userName
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
            feedCell.likeLbl.text = "μ’μμ " + "\(userInfo[indexPath.row].likeCount)" + "κ°"
            feedCell.userNameLbl.text = "\(userInfo[indexPath.row].userName)"
            feedCell.userNameLbl.font = .NotoSans(.bold, size: 16)
            feedCell.contentsLbl.text = "\(userInfo[indexPath.row].content!)"
            feedCell.contentsLbl.font = .NotoSans(.medium, size: 16)
            feedCell.commentAllLbl.setTitle("λκΈ " + "\(userInfo[indexPath.row].commentCount)" + "κ° λ³΄κΈ°", for: .normal)
            feedCell.postDataLbl.text = "\(userInfo[indexPath.row].dayInfo!.month)" + "μ " + "\(userInfo[indexPath.row].dayInfo!.day)" + "μΌ"
            
            feedCell.profileImage.load(url: URL(string: userInfo[indexPath.row].userProfileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
            feedImages = userInfo[indexPath.row].imgUrls
            feedCell.images = userInfo[indexPath.row].imgUrls
            feedCell.contentImages.load(url: URL(string: userInfo[indexPath.row].imgUrls[0])!)
            feedCell.postId = userInfo[indexPath.row].postId
            
            feedCell.isLike = userInfo[indexPath.row].likeState
            
            if userInfo[indexPath.row].likeState == 0 {     //like μλλ μ λ
                feedCell.likeBtn.setImage(UIImage(named: "like_uncheck"), for: .normal)
            }
            else {
                feedCell.likeBtn.setImage(UIImage(named: "like_check"), for: .normal)
            }
            
            
            return feedCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == storyCollectionView {
            print("ν΄λ¦­ν userId >> \(storyInfo[indexPath.row].userId)")
            
            let userId: Int = storyInfo[indexPath.row].userId
            
            
            
            let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
            storyVC.imagePassed = storyInfo[indexPath.row].profileUrl
            storyVC.userId = storyInfo[indexPath.row].userId
            
            self.navigationController?.pushViewController(storyVC, animated: true)
            
        }
        else {      //feed collection view
            switch indexPath.row {
            case 0:
                print("μ²« λ²μ§Έ νΌλ click")
            case 1:
                print("λ λ²μ§Έ νΌλ click")
            case 2:
                print("μΈ λ²μ§Έ νΌλ click")
            default:
                print("λλ¨Έμ§ νΌμ¦ clicked")
            }
//            let feedVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
//            self.navigationController?.pushViewController(feedVC, animated: true)
            postId = userInfo[indexPath.row].postId

            
            
        }

        
        
        
//        let storyVC = self.storyboard?.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
//        storyVC.imagePassed = storyPhoto[indexPath.row]
//        self.navigationController?.pushViewController(storyVC, animated: true)
    }

}

