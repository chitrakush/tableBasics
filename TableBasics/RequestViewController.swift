//
//  RequestViewController.swift
//  TableBasics
//
//  Created by chitra on 15/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = [[String: Any]]()
    //var testArray = ["name", "label2", "label3"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        //getRequestResponse()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell
        cell?.name.text = dataArray[indexPath.row]["name"] as? String
        cell?.email.text = dataArray[indexPath.row]["email"] as? String
        cell?.userName.text = dataArray[indexPath.row]["username"] as? String
        return cell!
    }

    @IBAction func getDataButton(_ sender: Any) {
       getRequestResponse()
        print(self.dataArray)
    }
    
    func getRequestResponse (){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
              //  print(jsonResponse) //Response result
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                self.dataArray = jsonArray
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //print(self.dataArray)
                //Now get title value
                //guard let name = self.dataArray[0]["name"] as? String else { return }
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
  
}
