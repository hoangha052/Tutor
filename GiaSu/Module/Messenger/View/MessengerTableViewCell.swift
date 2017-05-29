//
//  MessengerTableViewCell.swift
//  WorkID
//
//  Created by hoangha052 on 5/25/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit

class MessengerTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var messengerTextLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageTypeView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.avatarImageView.layer.cornerRadius = 23.0
        self.avatarImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
