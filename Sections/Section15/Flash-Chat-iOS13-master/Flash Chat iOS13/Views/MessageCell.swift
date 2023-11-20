//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Paulo Pinheiro on 11/19/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.cornerRadius = messageView.frame.size.height / 4
        
        // Initialization code
    }

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var label: UILabel!
 
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
