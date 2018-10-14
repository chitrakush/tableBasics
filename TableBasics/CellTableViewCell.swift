//
//  CellTableViewCell.swift
//  TableBasics
//
//  Created by chitra on 13/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataToReplace : String = "Chitra"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func button(_ sender: Any) {
        dataLabel.text = dataToReplace
    }
}
