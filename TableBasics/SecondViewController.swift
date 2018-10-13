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

    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel?.text = myString //"You Selected cell no. \(name)"
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("SecondViewController deinit")
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
