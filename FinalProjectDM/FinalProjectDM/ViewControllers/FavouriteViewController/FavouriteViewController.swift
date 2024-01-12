//
//  FavouriteViewController.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 19.07.2022.
//

import UIKit
import RealmSwift

class FavouriteViewController: UIViewController {
    
    
    @IBOutlet weak var favouriteSegmentTool: UISegmentedControl!
    @IBOutlet weak var favouriteTableView: UITableView!
    
    let realm = try! Realm()
    var movieSorted: [MediaModel] = []
    var seriesSorted: [MediaModel] = []
    var currentSavedMedia : [MediaModel] = []
    
    let posterUrl = "https://image.tmdb.org/t/p/w500"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        favouriteTableView.register(UINib(nibName: "FavouriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouriteTableViewCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMediaSaved()
        sortArrays()
        favouriteTableView.reloadData()
        
    }
    
    func sortArrays() {
        for mediaObject in currentSavedMedia {
            if mediaObject.type {
                movieSorted.append(mediaObject)
            } else {
                seriesSorted.append(mediaObject)
            }
        }
    }
    
    func loadMediaSaved () {

        currentSavedMedia = DataManager.globalDataManager.getMediaData()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        currentSavedMedia = []
         movieSorted = []
         seriesSorted = []
    }

    
    
    @IBAction func chooseSegment(_ sender: Any) {
        favouriteTableView.reloadData()
    }
    
    
}
