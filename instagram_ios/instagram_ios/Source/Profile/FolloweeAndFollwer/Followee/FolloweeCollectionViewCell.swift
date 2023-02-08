//
//  FolloweeCollectionViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/08.
//
import Alamofire
import UIKit

class FolloweeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var userNameBtn: UIButton!
    @IBOutlet weak var followBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        followBtn.addTarget(self, action: #selector(onClickUnfollow), for: .touchUpInside)
    }
    
    @objc func onClickUnfollow() {
        print("clicked")
    }

    
}
