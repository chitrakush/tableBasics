//
//  UserDetailViewController.swift
//  TableBasics
//
//  Created by chitra on 17/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelCompanyName: UILabel!
    var name: String?, username: String?, email: String?, company: String?
   
    var getIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name
        labelUserName.text = username
        labelEmail.text = email
        labelCompanyName.text = company
        // Do any additional setup after loading the view.
    }

    @IBAction func DeleteButton(_ sender: Any) {
        guard let index = getIndex else {
            print("nil index")
            return
        }

        NotificationCenter.default.post(name: Notification.Name("deleteUserNotification"), object: nil, userInfo: ["index": index])
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }

}
