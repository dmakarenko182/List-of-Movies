//
//  SetUp + EXTENSIONS.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 08.08.2022.
//

import UIKit

extension InfoCellViewController {
    
    func configMovieVC () {
        
        let posterPath = "https://image.tmdb.org/t/p/w500\(media?.posterPath ?? "")"
        
        movieTitleLabel.text = media?.originalTitle
        releaseDateLabel.text = "Release date: \(media?.releaseDate ?? "No data")"
        avarageRatingLabel.text = String((media!.voteAverage))
        movieOverviewLabel.text = media?.overview
        
        if media?.posterPath == "" {
            backgroundPosterView.image = UIImage.init(named: "noposter")
        } else {
        backgroundPosterView.sd_setImage(with: URL(string: posterPath))
        }
    }
    
    func configSeriesVC () {
        
        let posterUrl = "https://image.tmdb.org/t/p/w500\(media?.posterPath ?? "")"
        
        movieTitleLabel.text = media?.originalName ?? "No data"
        releaseDateLabel.text = "Release date: \(media?.firstAirDate ?? "No data")"
        if media?.posterPath == "" {
            backgroundPosterView.image = UIImage.init(named: "noposter")
        } else {
            backgroundPosterView.sd_setImage(with:URL(string: posterUrl))
        }
        
        movieOverviewLabel.text = media?.overview
        avarageRatingLabel.text = String((media?.voteAverage) ?? 0.0)
    }
    
    func configSavedMovie () {
        
        let posterPath = "https://image.tmdb.org/t/p/w500\(savedMedia?.posterPath ?? "")"
        
        movieTitleLabel.text = savedMedia?.movieName
        releaseDateLabel.text = "Release date: \(savedMedia?.movieReleaseDate ?? "No data")"
        avarageRatingLabel.text = String((savedMedia!.voteAverage))
        movieOverviewLabel.text = savedMedia?.overview
        
        if savedMedia?.posterPath == "" {
            backgroundPosterView.image = UIImage.init(named: "noposter")
        } else {
        backgroundPosterView.sd_setImage(with: URL(string: posterPath))
        }
    }
    
    func configSavedSeries () {
        
        let posterUrl = "https://image.tmdb.org/t/p/w500\(savedMedia?.posterPath ?? "")"
        
        movieTitleLabel.text = savedMedia?.tvName
        releaseDateLabel.text = "Release date: \(savedMedia?.firstAirDate ?? "No data")"
        if media?.posterPath == "" {
            backgroundPosterView.image = UIImage.init(named: "noposter")
        } else {
            backgroundPosterView.sd_setImage(with:URL(string: posterUrl))
        }
        
        movieOverviewLabel.text = savedMedia?.overview
        avarageRatingLabel.text = String((savedMedia?.voteAverage) ?? 0.0)
    }
    
    
    
    
}
