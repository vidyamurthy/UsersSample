//
//  User.swift
//  UsersSample
//
//  Created by Vidya Murthy on 11/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import Foundation

class User {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: String?
    var phone: String?
    var website: String?
    
    func getConcatenatedAddress(address: Dictionary<String, Any>) -> String{
        
        let suite: String = address["suite"]! as! String
        let street: String = address["street"]! as! String
        let city: String = address["city"]! as! String
        let zipcode: String = address["zipcode"]! as! String
        
        let concatenatedAddress = suite +  ", " + street + "\n" + city + ", " + zipcode
        return concatenatedAddress
    }
}
