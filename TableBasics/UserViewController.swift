//
//  UserViewController.swift
//  TableBasics
//
//  Created by chitra on 18/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DeleteArrayProtocol {
 
    var dataArray = [[String: Any]]()
    var tempName: String?
    var tempUsername: String?
    var tempEmail: String?
    var tempCompany: [String:Any]?
    var indexToPass: Int?
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequestResponse()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "userCellData", for: indexPath) as? userCell
        cell?.name.text = dataArray[indexPath.row]["name"] as? String
        cell?.email.text = dataArray[indexPath.row]["email"] as? String
        cell?.userName.text = dataArray[indexPath.row]["username"] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         tempName = dataArray[indexPath.row]["name"] as? String
         tempUsername = dataArray[indexPath.row]["email"] as? String
         tempEmail = dataArray[indexPath.row]["username"] as? String
        if let company = dataArray[indexPath.row]["company"] as? [String:Any] {
           tempCompany = company
        }
         indexToPass = indexPath.row
        performSegue(withIdentifier: "cellToUserDetailSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempName = tempName,
            let tempUsername = tempUsername,
            let tempEmail = tempEmail,
            let company = tempCompany,
            let index = indexToPass else {
            print("nil values found in segue pass")
            return
        }
        let vc = (segue.destination as? UserDetailViewController)
        vc?.name = tempName
        vc?.username = tempUsername
        vc?.email = tempEmail
        vc?.company = company
        vc?.getIndex = index
        vc?.delegate = self
        
    }
    
    func deleteUserFromArray(indexValue: Int){
        dataArray.remove(at: indexValue)
        self.tableView.reloadData()
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
                //guard let name = self.dataArray[0]["name"] as? String else { return }
                
              } catch let parsingError {
                print("Error", parsingError)
              }
            
        }
        task.resume()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "cellToUserDetailSegue" {
//
//        }
//    }
  
    @IBAction func getDataButton(_ sender: Any) {
        getRequestResponse()
    }

}
