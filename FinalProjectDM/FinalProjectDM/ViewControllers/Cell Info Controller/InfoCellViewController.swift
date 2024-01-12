//
//  InfoCellViewController.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 07.08.2022.
//

import UIKit


class InfoCellViewController: UIViewController {

    var media: Media?
    var savedMedia: MediaModel?
    var type: VideoType?
    var searchType: VideoType?
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var avarageRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    @IBOutlet weak var backgroundPosterView: UIImageView!
    
    let networking = NetworkService()
    var mainFavArr: [MediaModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonTapped(_:)))
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        switch searchType {
        case .movie:
            configMovieVC()
        case .tv:
            configSeriesVC()
        default:
            break
        }
        
        switch type {
        case .movie:
            configSavedMovie()
        case .tv:
            configSavedSeries()
        default:
            break
        }
      
        
    }
    
    func favArrGet (_ incomeArr: [MediaModel], _ type: Int) {
       
        
    }
                                                          
                                                            
    
    @objc func saveButtonTapped(_ sender: Any) {
        
        switch searchType {
        case .movie:
            DataManager.globalDataManager.saveMediaData(media: media, type: true)
        case .tv:
            DataManager.globalDataManager.saveMediaData(media: media, type: false)
        default:
            break
        }
        
    }
}
