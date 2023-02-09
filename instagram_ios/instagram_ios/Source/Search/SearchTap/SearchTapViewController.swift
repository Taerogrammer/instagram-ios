//
//  SearchTapViewController.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/02.
//

import Foundation
import UIKit
import Alamofire


class SearchTapViewController: UIViewController {
    
    @IBOutlet weak var buttonTop : UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var dmBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var likeLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var commentAllBtn: UIButton!
    @IBOutlet weak var postDateLbl: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var selectedImages: UIImageView!
    
    lazy var postId: Int = 0
    var images :[String] = []
    
    var userInfo: SearchTapResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backNavigationSetting()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getPopularPost()
        }
        
    }

    func backNavigationSetting() {
        title = "탐색 탭"
        
        let backImage = UIImage(named: "backBtn")!
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height))
        backButton.setImage(backImage, for: .normal)
        backButton.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        let barBackButton = UIBarButtonItem(customView: backButton)
        
        navigationController?.hidesBarsOnSwipe = false
        self.navigationItem.leftBarButtonItem = barBackButton
    }
    
    
    //MARK: image page control --> 아직 안해봄
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage<pageControl.numberOfPages-1) {
//                    pageControl.currentPage = pageControl.currentPage + 1
                    
                    pageControl.currentPage = 1
                }
                print("Swiped Left")
                print(pageControl.currentPage)
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage>0) {
                    pageControl.currentPage = pageControl.currentPage - 1
                }
                print("Swiped Right")
            default:
                break
            }
            
            let feedUrl = URL(string: images[pageControl.currentPage])
            selectedImages.load(url: feedUrl!)
        }
    }
    
    @IBAction func imageChange(_ sender: UIPageControl) {
        let feedUrl = URL(string: images[pageControl.currentPage])
        selectedImages.load(url: feedUrl!)
    }
    
    
    
    
    func getPopularPost() {
        AF.request("\(Constant.Base_URL)/app/posts/popular/\(postId)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: SearchTapResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("GET SUCCESS >> \(Constant.Base_URL)/app/users/posts/\(self.postId)")
                print(response)
//                DispatchQueue.main.async {
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
//                    vc.profileImg.load(url: URL(string: response.result?.userProfileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
//                    vc.userNameBtn.setTitle("\(response.result?.userName)", for: .normal)
//                    vc.contentLbl.text = "\(response.result?.content)"
//                }
                self.userInfo = response.result
                
                DispatchQueue.main.async {  //댓글 개수 조회
                    AF.request("\(Constant.Base_URL)/app/posts/\(response.result!.postId)/all-comments", method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: GetCommentResponse.self) { response in
                        switch response.result {
                        case .success(let response):
                            print("댓글 SUCCESS >> \(response)")
                            self.commentAllBtn.setTitle("댓글 \(response.result)개 전체 보기", for: .normal)
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.buttonTop.setTitle("\(response.result!.userName)", for: .normal)
                    self.buttonTop.titleLabel?.font = .NotoSans(.bold, size: 14)
                    self.buttonTop.contentHorizontalAlignment = .left
                    self.buttonTop.contentVerticalAlignment = .center
                    if response.result?.likeState == 1 {
                        self.likeBtn.setImage(UIImage(named: "like_check"), for: .normal)
                    }
                    else {
                        self.likeBtn.setImage(UIImage(named: "like_uncheck"), for: .normal)
                    }
                    self.likeLbl.text = "좋아요 " + "\(response.result!.likeCount)" + "개"
                    self.userNameLbl.text = "\(response.result!.userName)"
                    self.userNameLbl.font = .NotoSans(.bold, size: 16)
                    
                    self.contentLbl.text = "\(response.result?.content ?? "")"
                    self.postDateLbl.text = "\(response.result!.dayDetailDto!.day)"
                    self.profileImage.load(url: URL(string: response.result?.userProfileUrl ?? "https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg")!)
                    self.images = response.result!.imgUrls
                    self.selectedImages.load(url: URL(string: self.images[0])!)
                    
                    
                    if self.images.count == 1 {
                        print("이미지 1개")
                        self.pageControl.isHidden = true
                        
                        
                    }
                    else {
                        print("이미지 2개 이상")
                        self.pageControl.numberOfPages = self.images.count
                        self.pageControl.currentPage = 0
                        self.pageControl.pageIndicatorTintColor = UIColor.gray
                        self.pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
                        self.selectedImages.load(url: URL(string: self.images[0])!)
                        
                    }
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    @IBAction func onClickComment() {
        let commentVC = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        commentVC.getUserInfo = userInfo
        self.navigationController?.pushViewController(commentVC, animated: true)   
    }

    
    
}


extension SearchTapViewController {
    func didSuccessGetPost(_ result: SearchTapResult) {
        self.presentAlert(title: "성공", message: "스토리 조회")
        
        print("didSuccessGetPost() success")
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
