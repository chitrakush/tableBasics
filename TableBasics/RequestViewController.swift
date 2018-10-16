//
//  RequestViewController.swift
//  TableBasics
//
//  Created by chitra on 15/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, userDataLink {
    
    var dataArray = [AnyObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            let result = response.result
            print(result.value!)
            
            guard let resultx = result.value else {
                print("data nil")
                return
            }
            
            self.dataArray = resultx as! [AnyObject]
            print(self.dataArray)
            self.tableView.reloadData()
            
        }
       
        //            if let data = response.data {
        //                print("Data: \(String(describing: data))")
        //            }
        
        //
        //            do {
        //                let json = try JSON(data: response.data!)
        //                if let userName = json[0]["name"].string {
        //                    //Now you got your value
        //                    self.showInfo.text = json
        //                }
        //            }
        //            catch {
        //                print("json undefined")
        //            }
        
        //            if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
        //                let json = JSON(data: dataFromString)
        //            }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserDataCell
//        print( )
        if let dataIndexId = dataArray[indexPath.row]["id"] {
            cell?.userId.text = "\(dataIndexId)"
        }
        else {
            cell?.userId.text = "not defined"
        }
        cell?.userName.text = dataArray[indexPath.row]["name"] as? String
        cell?.userEmail.text = dataArray[indexPath.row]["email"] as? String
        return cell!
    }
    
    func passUserData(name: String?, id: Int?, email: String?) {
        
    }
    
    @IBAction func getDataButton(_ sender: Any) {
        
    }

}
