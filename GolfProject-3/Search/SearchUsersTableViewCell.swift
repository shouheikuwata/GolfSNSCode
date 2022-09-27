//
//  SearchUsersTableViewCell.swift
//  GolfProject-3
//
//  Created by 桑田翔平 on 2021/05/19.
//

import UIKit

class SearchUsersTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userIdLabel: UILabel!
    @IBOutlet var userFollowLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
