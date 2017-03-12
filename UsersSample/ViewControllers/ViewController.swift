//
//  ViewController.swift
//  UsersSample
//
//  Created by Vidya Murthy on 11/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var usersList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "User List"
        
        NetworkManager.sharedManager.getAllUsers(completionHandler: { users in
            for user in users! {
                self.usersList.append(user)
            }
            DispatchQueue.main.async(){
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCustomTableViewCell
        
        let user = self.usersList[indexPath.row]
        cell.initialzeCell(user: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let user = self.usersList[indexPath.row]
        
        if let postVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostViewController") as? PostViewController {
            if let navigator = navigationController {
                postVC.userID = user.id
                navigator.pushViewController(postVC, animated: true)
            }
        }
    }
}
