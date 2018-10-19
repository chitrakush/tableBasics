//
//  userCell.swift
//  TableBasics
//
//  Created by chitra on 18/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class userCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
