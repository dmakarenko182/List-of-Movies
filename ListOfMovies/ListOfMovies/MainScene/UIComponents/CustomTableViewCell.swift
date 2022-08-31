//
//  CustomTableViewCell.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    //MARK: Methods
    func configureMovieCell(movieNameInfo: String, movieYearInfo: String) {
        movieInfoLabel.text = movieNameInfo
        movieYearLabel.text = movieYearInfo
    }
}
