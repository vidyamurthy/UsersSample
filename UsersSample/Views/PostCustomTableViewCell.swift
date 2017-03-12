//
//  PostCustomTableViewCell.swift
//  UsersSample
//
//  Created by Vidya Murthy on 12/03/17.
//  Copyright © 2017 Vidya Murthy. All rights reserved.
//

import UIKit

class PostCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func initializeWith(post: Post) {
        self.titlelabel.text = post.title
        self.bodyLabel.text = post.body
    }
}
