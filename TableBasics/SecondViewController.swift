//
//  SecondViewController.swift
//  TableBasics
//
//  Created by chitra on 13/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    var myString: String?
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        infoLabel?.text = myString
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
