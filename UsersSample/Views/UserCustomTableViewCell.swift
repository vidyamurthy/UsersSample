//
//  UserCustomTableViewCell.swift
//  UsersSample
//
//  Created by Vidya Murthy on 11/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import UIKit

class UserCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func initialzeCell(user: User) {
        
        let font = UIFont(name: "HelveticaNeue-MediumItalic", size: 16.0)!
        
        let nameAttributed = NSMutableAttributedString.init(string: "Name: " + user.name!)
        nameAttributed.addAttributes([NSFontAttributeName: font], range: NSRange.init(location: 0, length: 6))
        
        self.nameLabel.attributedText = nameAttributed
        
        let userNameAttributed = NSMutableAttributedString.init(string: "Username: " + user.username!)
        userNameAttributed.addAttributes([NSFontAttributeName: font], range: NSRange.init(location: 0, length: 10))
        
        self.usernameLabel.attributedText = userNameAttributed
        
        let emailAttributed = NSMutableAttributedString.init(string: "Email: " + user.email!)
        emailAttributed.addAttributes([NSFontAttributeName: font], range: NSRange.init(location: 0, length: 6))
        
        self.emailLabel.attributedText = emailAttributed
        
        let addressAttributed = NSMutableAttributedString.init(string: "Address: " + user.address!)
        addressAttributed.addAttributes([NSFontAttributeName: font], range: NSRange.init(location: 0, length: 9))
        
        self.addressLabel.attributedText = addressAttributed
    }
    
}
