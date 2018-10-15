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
    var dataInfo : String?
    let cellData = ["red", "green", "yellow", "blue", "lightGray", "magenta", "cyan", "purple", "brown", "white"]
    var secondVCbgColor: UIColor?
    let image = UIImage(named: "dice2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func buttonCLicked (color: String?) {
        let getColor = uiColorMaker(color: color)
        self.view.backgroundColor = getColor
    }
    
    func uiColorMaker( color: String?) -> UIColor {
            switch color {
            case "red": return UIColor.red
            case "blue": return UIColor.blue
            case "green": return UIColor.green
            case "yellow": return UIColor.yellow
            case "lightGray": return UIColor.lightGray
            case "magenta": return UIColor.magenta
            case "cyan": return UIColor.cyan
            case "purple": return UIColor.purple
            case "brown": return UIColor.brown
            case "white": return UIColor.white
            default: return UIColor.black
            }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.dataLabel.text = cellData[indexPath.row]
        cell?.dataImage.image = image
        cell?.colorName = cellData[indexPath.row]
        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         dataInfo = cellData[indexPath.row]
        secondVCbgColor = uiColorMaker(color: cellData[indexPath.row])
        performSegue(withIdentifier: "LinkObject", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SecondViewController
        vc?.myString = dataInfo
        vc?.bgColor = secondVCbgColor
    }
   
}



