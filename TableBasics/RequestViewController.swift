//
//  requestViewController.swift
//  TableBasics
//
//  Created by chitra on 15/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestViewController: UIViewController {

    @IBOutlet weak var showInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getDataButton(_ sender: Any) {
        // we are in test branch
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request //
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
                self.showInfo.text = String(describing: json)
            }
            else {
                self.showInfo.text = "data undefined"
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
//
            
        }
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
