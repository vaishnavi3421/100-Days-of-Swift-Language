//
//  DemoTableViewCell.swift
//  Table View With Custom Cell
//
//  Created by Vaishnavi Wahgule on 16/01/25.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    @ IBOutlet var myLabel: UILabel!
    @ IBOutlet var myImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
