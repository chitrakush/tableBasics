//
//  UserViewController.swift
//  TableBasics
//
//  Created by chitra on 18/10/2018.
//  Copyright © 2018 chitra. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var userData: [User] = []
    var tempName: String?
    var tempUsername: String?
    var tempEmail: String?
    var tempCompany: String?
    var indexToPass: Int?
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequestResponse()
        registerNotification()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "userCellData", for: indexPath) as? userCell
        cell?.name.text = userData[indexPath.row].name
        cell?.email.text = userData[indexPath.row].email
        cell?.userName.text = userData[indexPath.row].username
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         tempName = userData[indexPath.row].name
         tempUsername = userData[indexPath.row].username
         tempEmail = userData[indexPath.row].email
         tempCompany = userData[indexPath.row].company.name
        
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
        
    }
    
    @objc func deleteUserFromArray(_ notification: NSNotification){
        guard  let indexDict = notification.userInfo as NSDictionary? else {
            print("nil indexArray found")
            return
        }
        if let indexValue = indexDict["index"] as? Int{
            userData.remove(at: indexValue)
            self.tableView.reloadData()
        }
        
    }
    
    func getRequestResponse (){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([User].self, from: dataResponse)
                self.userData = decodedResponse
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
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(deleteUserFromArray(_ :)), name: NSNotification.Name("deleteUserNotification"), object: nil)
    }
  
    @IBAction func getDataButton(_ sender: Any) {
        getRequestResponse()
    }

}
