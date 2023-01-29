//
//  ModalTableViewCell.swift
//  instagram_ios
//
//  Created by 김태형 on 2023/01/29.
//

import UIKit

class ModalTableViewCell: UITableViewCell {

    @IBOutlet weak var modalImg: UIImageView!
    @IBOutlet weak var modalName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
