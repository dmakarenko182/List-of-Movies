//
//  MovieTableViewCell.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 25.07.2022.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieLength: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureMovieCell (mediaArray: Media) {
        
        let posterUrl = "https://image.tmdb.org/t/p/w500\(mediaArray.posterPath)"
        
        movieTitle.text = mediaArray.originalTitle
        movieGenre.text = mediaArray.releaseDate
        if mediaArray.posterPath == "" {
            posterMovie.image = UIImage.init(named: "noposter")
        } else {
            posterMovie.sd_setImage(with:URL(string: posterUrl))
        }
        
        movieOverview.text = mediaArray.overview
        movieLength.text = String((mediaArray.voteAverage))
    }
    
    func configureSeriesCell (mediaArray: Media) {
        
        let posterUrl = "https://image.tmdb.org/t/p/w500\(mediaArray.posterPath)"
        
        movieTitle.text = mediaArray.originalName
        movieGenre.text = mediaArray.firstAirDate
        if mediaArray.posterPath == "" {
            posterMovie.image = UIImage.init(named: "noposter")
        } else {
            posterMovie.sd_setImage(with:URL(string: posterUrl))
        }
        
        movieOverview.text = mediaArray.overview
        movieLength.text = String((mediaArray.voteAverage))
    }
    
}
