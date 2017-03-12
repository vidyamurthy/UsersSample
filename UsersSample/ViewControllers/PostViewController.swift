//
//  PostViewController.swift
//  UsersSample
//
//  Created by Vidya Murthy on 12/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userID : Int?
    var postsList: [Post] = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Post List"
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        
        NetworkManager.sharedManager.getAllPostsFor(userId: self.userID!, completionHandler: { posts in
            for post in posts! {
                self.postsList.append(post)
            }
            DispatchQueue.main.async(){
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCustomTableViewCell
        
        let post = self.postsList[indexPath.row]
        cell.initializeWith(post: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
