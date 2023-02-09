//
//  FeedCollectionViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

import UIKit
import Alamofire

class FeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topUserNameBtn : UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var dmBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var likeLbl : UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var contentsLbl: UILabel!
    @IBOutlet weak var commentAllLbl: UIButton!
    @IBOutlet weak var postDataLbl: UILabel!
    
    @IBOutlet weak var contentImages: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = []
    var isLike: Int = 0
    var postId: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.addGestureRecognizer(swipeRight)
        
        
        DispatchQueue.main.async {
            print("FEED IMAGE >> \(self.images)")
            self.pageControl.numberOfPages = self.images.count
            if self.pageControl.numberOfPages == 1 {
                self.pageControl.isHidden = true
            }
        }

    }
    
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
            contentImages.load(url: feedUrl!)
        }
    }
    
    @IBAction func imageChange(_ sender: UIPageControl) {
        let feedUrl = URL(string: images[pageControl.currentPage])
        contentImages.load(url: feedUrl!)
    }
    
    @IBAction func onClickLikeButton() {
        print("좋아요 유무 >> \(isLike)")
        if isLike == 1 {     //false로 바꿔야지
            postUnlikeButton()
            print("like 눌려있을 때 >> \(isLike)")
        }
        else {      //좋아요가 안눌려있으니, 누르면 좋아요 눌러지기
            postLikeButton()
        }
    }
    
    
    func postLikeButton() {
        AF.request("\(Constant.Base_URL)/app/likes/\(postId)", method: .post, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: LikeResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
//                DispatchQueue.main.async {
                    self.likeBtn.setImage(UIImage(named: "like_uncheck"), for: .normal)
//                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func postUnlikeButton() {
        AF.request("\(Constant.Base_URL)/app/unlikes/\(postId)", method: .post, parameters: nil, encoding: URLEncoding.default, headers: ["X-ACCESS-TOKEN" : "\(UserDefaults.standard.string(forKey: "userJwt")!)"]).validate().responseDecodable(of: LikeResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("SUCCESS >> \(response)")
//                DispatchQueue.main.async {
                    self.likeBtn.setImage(UIImage(named: "like_check"), for: .normal)
//                }
            case .failure(let error):
                print(error)
            }
        }

    }

    
//    @IBAction func onClickComment() {
//        
//        let storyboard = UIStoryboard(name: "CommentViewController", bundle: nil)
//        let commentVC = storyboard.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
////        self.navigationController?.pushViewController(commentVC, animated: true)
//        commentVC.present(commentVC, animated: true)
//        
//    }
    
//    extension EditViewController {
//        func didSuccessEdit(_ result: EditResult) {
//            self.presentAlert(title: "회원 정보 수정", message: "회원 정보가 수정되었습니다")
//
//            print("didSuccessEdit() success")
//        }
//
//        func failedToRequest(message: String) {
//            self.presentAlert(title: message)
//        }
//    }
    
    
    
}
