//
//  FavouriteTableView+EXTENSION.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 19.07.2022.
//
import UIKit
import Foundation

extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch favouriteSegmentTool.selectedSegmentIndex {
        case 0:
            return movieSorted.count
        case 1:
            return seriesSorted.count
        default:
            return 0
        }
     
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell else {return UITableViewCell() }
        if favouriteSegmentTool.selectedSegmentIndex == 0 {
            cell.titleSavedLabel.text = movieSorted[indexPath.row].movieName
            cell.mediaTypeLabel.text = movieSorted[indexPath.row].movieReleaseDate
            cell.avarageRatingLabel.text = String(movieSorted[indexPath.row].voteAverage)
            cell.overviewSavedlabel.text = movieSorted[indexPath.row].overview
            cell.posterSavedView.sd_setImage(with: URL(string: posterUrl + movieSorted[indexPath.row].posterPath))
        } else {
            cell.titleSavedLabel.text = seriesSorted[indexPath.row].tvName
            cell.mediaTypeLabel.text = seriesSorted[indexPath.row].firstAirDate
            cell.avarageRatingLabel.text = String(seriesSorted[indexPath.row].voteAverage)
            cell.overviewSavedlabel.text = seriesSorted[indexPath.row].overview
            cell.posterSavedView.sd_setImage(with: URL(string: posterUrl + seriesSorted[indexPath.row].posterPath))
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
        
            tableView.beginUpdates()
           
            tableView.deleteRows(at: [indexPath], with: .fade)
            switch favouriteSegmentTool.selectedSegmentIndex {
            case 0:
               
                try! realm.write({
                    realm.delete(movieSorted[indexPath.row])
                })
                movieSorted.remove(at: indexPath.row)
                loadMediaSaved()
            case 1:
             
               
              
                try! realm.write({
                    realm.delete(seriesSorted[indexPath.row])
                })
                seriesSorted.remove(at: indexPath.row)
                loadMediaSaved()
            default:
                break
            }
            
            tableView.endUpdates()
           

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let infoCellViewController = storyBoard.instantiateViewController(withIdentifier: "Info") as! InfoCellViewController
        
        
        switch favouriteSegmentTool.selectedSegmentIndex {
        case 0:
            infoCellViewController.savedMedia = movieSorted[indexPath.row]
            infoCellViewController.type = .movie
        case 1:
            infoCellViewController.savedMedia = seriesSorted[indexPath.row]
            infoCellViewController.type = .tv
            
        default:
            break
        }
        

        navigationController?.pushViewController(infoCellViewController, animated: true)
        
        
    }
    
    
}
