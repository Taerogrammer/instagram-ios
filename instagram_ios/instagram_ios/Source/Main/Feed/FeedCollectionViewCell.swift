//
//  FeedCollectionViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/04.
//

import UIKit

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
    var isImageOne: Bool = true
    
    
    
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
            print(self.pageControl.numberOfPages)
            
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
    
//    @IBAction func onClickComment() {
//        
//        let storyboard = UIStoryboard(name: "CommentViewController", bundle: nil)
//        let commentVC = storyboard.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
////        self.navigationController?.pushViewController(commentVC, animated: true)
//        commentVC.present(commentVC, animated: true)
//        
//    }
    
    
    
}
