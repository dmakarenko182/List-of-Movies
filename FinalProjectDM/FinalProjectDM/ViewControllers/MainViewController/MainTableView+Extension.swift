//
//  MainTableView+Extension.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 19.07.2022.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMediaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        
        
        if mainSegmentTool.selectedSegmentIndex == 0 {
            cell.configureMovieCell(mediaArray: currentMediaArray[indexPath.row])
            
            return cell
            
        } else {
            cell.configureSeriesCell(mediaArray: currentMediaArray[indexPath.row])
            
            return cell
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var second = 0
        var type : VideoType = .movie
        
        if mainSegmentTool.selectedSegmentIndex == 1 {
            type = .tv
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            second -= 1
        }
        
        
        if second == 0 {
            
            NetworkMediaReq.createRequest(true, type, searchText: searchText) { result in
                self.currentMediaArray = result
                
            }
        }
        
        mainSearchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    
        
        if mainSegmentTool.selectedSegmentIndex == 0 {
            NetworkMediaReq.createRequest(false, type, searchText: nil) { result in
                self.currentMediaArray = result
            }
        } else {
            type = .tv
            NetworkMediaReq.createRequest(false, type, searchText: nil) { result in
                self.currentMediaArray = result
            }
        }
        
        mainSearchBar.text = ""
        mainSearchBar.showsCancelButton = false
        
        mainTableView.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let infoCellViewController = storyBoard.instantiateViewController(withIdentifier: "Info") as! InfoCellViewController
        
        
        
        infoCellViewController.media = currentMediaArray[indexPath.row]
        
        switch mainSegmentTool.selectedSegmentIndex {
        case 0:
            infoCellViewController.searchType = .movie
        case 1:
            infoCellViewController.searchType = .tv
        default:
            return
        
        }
        
        navigationController?.pushViewController(infoCellViewController, animated: true)
        
        
    }
    
    
    
    
    
    
    
    
    
}







