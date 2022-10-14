//
//  MovieCell.swift
//  MovieApp2
//
//  Created by admin on 22/09/22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overviewT: UITextView!
    
    @IBOutlet weak var titleL: UILabel!
    
    @IBOutlet weak var posterI: UIImageView!
    
    @IBOutlet weak var releaseL: UILabel!
    
    @IBOutlet weak var ratingL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
