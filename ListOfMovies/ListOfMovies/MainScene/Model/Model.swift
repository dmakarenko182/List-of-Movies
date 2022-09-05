//
//  Methods.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import Foundation
import OrderedCollections

class Model {
    //MARK: Properties
    private var movies: OrderedSet<MovieModel> = [] {
        didSet {
            guard movies != oldValue else {
                view?.presentAlert("Dup")
                return
            }
            view?.updateMovies(movies)
        }
    }
    
    weak var view: View?
    
    //MARK: Methods
    func addMovie(_ nameText: String, _ yearText: String) {
        guard !nameText.isEmpty, !yearText.isEmpty else {
            view?.presentAlert("Fields are empty")
            return
        }
        
        let movie = MovieModel(name: nameText, year: yearText)
        movies.append(movie)
    }
}
