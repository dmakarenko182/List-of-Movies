//
//  Methods.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import Foundation
import UIKit

class Model {
    
    weak var view: AlertProvider?
    var movieArray: [MovieModel] = []
    var flag = 1
    
    func addNewText(_ nameText: String, _ yearText: String) {
        if nameText == "" || yearText == "" {
            view?.presentAlert("Please, fill out all fields")
        } else {
            let validation = validateRepeatFilm(nameText, yearText)

            if validation {
                let model = MovieModel(movieName: nameText, movieYear: yearText)
                movieArray.append(model)
            }
        }
    }
}

private extension Model {
    func validateRepeatFilm(_ nameText: String, _ yearText: String) -> Bool {
            for index in movieArray {
                if index.movieName == nameText && index.movieYear == yearText {
                    view?.presentAlert("Film is duplicate")
                    movieArray.removeLast()
                }
            }
            return true
    }
}
