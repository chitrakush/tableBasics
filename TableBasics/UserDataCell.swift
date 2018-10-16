//
//  UserDataCell.swift
//  TableBasics
//
//  Created by chitra on 16/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

protocol userDataLink {
    func passUserData(name: String?, id: Int?, email: String?)
}

class UserDataCell: UITableViewCell {
    
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var delegateObject: userDataLink?
//
//    var name: String?
//    var id: Int?
//    var email: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        delegateObject?.passUserData(name: name, id: id, email: email)
        // Configure the view for the selected state
    }
    

}
