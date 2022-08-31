//
//  MainTableView + Extensions.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CustomTableViewCell else {return UITableViewCell() }
        cell.configureMovieCell(movieNameInfo: model.movieArray[indexPath.row].movieName, movieYearInfo: model.movieArray[indexPath.row].movieYear)
        return cell
    }
}
