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
    

    
    
//    @IBAction func onClickComment() {
//        
//        let storyboard = UIStoryboard(name: "CommentViewController", bundle: nil)
//        let commentVC = storyboard.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
////        self.navigationController?.pushViewController(commentVC, animated: true)
//        commentVC.present(commentVC, animated: true)
//        
//    }
    
    
    
}
