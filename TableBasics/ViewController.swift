//
//  ViewController.swift
//  TableBasics
//
//  Created by chitra on 13/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, linkCellToView {

    @IBOutlet weak var heading: UILabel!
    let cellData = ["1","2","3","4","5","6","7","8","9","10"]
    var dataInfo : String?
    let image = UIImage(named: "dice2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func buttonCLicked () {
        self.view.backgroundColor = UIColor.red
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.dataLabel.text = cellData[indexPath.row]
        cell?.dataImage.image = image
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         dataInfo = cellData[indexPath.row]
        
        performSegue(withIdentifier: "LinkObject", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SecondViewController
        vc?.myString = dataInfo
    }
   
}



