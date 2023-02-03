//
//  MakeTableViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/02/03.
//

import UIKit

class MakeTableViewCell: UITableViewCell {

    @IBOutlet weak var makeImage: UIImageView!
    @IBOutlet weak var makeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
