//
//  Methods.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import Foundation

class Model {
    //MARK: Properties
    private var movieArray: [MovieModel] = [] {
        didSet {
            view?.updateMovies(movieArray)
        }
    }
    
    weak var view: View?
    
    //MARK: Methods
    func addMovie(_ nameText: String, _ yearText: String) {
        guard !nameText.isEmpty, !yearText.isEmpty else {
            view?.presentAlert("Fields are empty")
            return
        }
        
        let film = MovieModel(name: nameText, year: yearText)
        guard !movieArray.contains(film) else {
            view?.presentAlert("You have already saved this one")
            return
        }
        
        movieArray.append(film)
    }
}
