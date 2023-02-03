//
//  StoryCollectionViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    static let identifier = "StoryCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "StoryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with stories: Story) {
        self.userName.text = stories.userName
        self.userImage.image = UIImage(named: stories.userImage)
    }
    
    

}
