//
//  MovieModel.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import Foundation

enum Section {
    case main
}

struct MovieModel: Hashable {
    let name: String
    let year: String
}
