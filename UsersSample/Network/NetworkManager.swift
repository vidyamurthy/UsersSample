//
//  NetworkManager.swift
//  UsersSample
//
//  Created by Vidya Murthy on 11/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let sharedManager = NetworkManager()
    
    func getAllUsers(completionHandler: @escaping ([User]?) -> ()) {
    
        var usersArray = [User]()
        
        let urlString: String = "https://jsonplaceholder.typicode.com/users"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                else {
                    do {
                        let jsonObj = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                        guard let resultArray = jsonObj as? [Dictionary<String, Any>] else {
                            print("Not an Arrray")
                            return
                        }
                        for obj in resultArray {
                            let user = User()
                            user.id = obj["id"] as? Int
                            user.name = obj["name"] as? String
                            user.username = obj["username"] as? String
                            user.email = obj["email"] as? String
                            user.phone = obj["phone"] as? String
                            user.website = obj["website"] as? String
                            let address: String = user.getConcatenatedAddress(address: obj["address"] as! Dictionary)
                            user.address = address
                            usersArray.append(user)
                        }
                        completionHandler(usersArray)
                    }
                    catch let error as NSError {
                        print("Found an error - \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
    func getAllPostsFor(userId: Int, completionHandler: @escaping ([Post]?) -> ()) {
        
        var postsArray = [Post]()
        
        let urlString: String = "https://jsonplaceholder.typicode.com/posts?userId=\(userId)"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                else {
                    do {
                        let jsonObj = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                        guard let resultArray = jsonObj as? [Dictionary<String, Any>] else {
                            print("Not an Arrray")
                            return
                        }
                        for obj in resultArray {
                            let post = Post()
                            post.id = obj["id"] as? Int
                            post.title = obj["title"] as? String
                            post.body = obj["body"] as? String
                            postsArray.append(post)
                        }
                        completionHandler(postsArray)
                    }
                    catch let error as NSError {
                        print("Found an error - \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
}
