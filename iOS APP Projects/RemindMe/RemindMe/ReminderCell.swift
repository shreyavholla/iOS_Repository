//
//  ReminderCell.swift
//  RemindMe
//
//  Created by admin on 14/09/22.
//

import UIKit

class ReminderCell: UITableViewCell {

    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var labelL: UILabel!
    
    @IBOutlet weak var dateL: UILabel!
    
    @IBOutlet weak var timeL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

