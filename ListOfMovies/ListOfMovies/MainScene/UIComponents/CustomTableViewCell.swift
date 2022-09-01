//
//  CustomTableViewCell.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet private weak var movieInfoLabel: UILabel!
    @IBOutlet private weak var movieYearLabel: UILabel!
    
    
    //MARK: Methods
    func configure(with model: MovieModel) {
        movieInfoLabel.text = model.name
        movieYearLabel.text = model.year
    }
}
