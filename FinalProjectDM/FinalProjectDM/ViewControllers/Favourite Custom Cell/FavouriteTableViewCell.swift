//
//  FavouriteTableViewCell.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 02.08.2022.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var posterSavedView: UIImageView!
    @IBOutlet weak var titleSavedLabel: UILabel!
    @IBOutlet weak var mediaTypeLabel: UILabel!
    @IBOutlet weak var avarageRatingLabel: UILabel!
    @IBOutlet weak var overviewSavedlabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
