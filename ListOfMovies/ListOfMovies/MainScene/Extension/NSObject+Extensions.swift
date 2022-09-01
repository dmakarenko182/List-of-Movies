//
//  NSObject+Extensions.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 01.09.2022.
//

import Foundation

extension NSObject {
    static var identifier: String { String(describing: Self.self) }
}
