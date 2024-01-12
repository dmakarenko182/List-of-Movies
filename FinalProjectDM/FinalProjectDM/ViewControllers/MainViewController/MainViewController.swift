//
//  ViewController.swift
//  FinalProjectDM
//
//  Created by Danylo Makarenko on 19.07.2022.
//

import RealmSwift
import UIKit

class MainViewController: UIViewController {
    
    var type: VideoType = .movie
    
    @IBOutlet weak var mainSearchBar: UISearchBar!
    @IBOutlet weak var mainSegmentTool: UISegmentedControl!
    @IBOutlet weak var mainTableView: UITableView!
    
    //MARK: NS init
    
    var NetworkMediaReq = NetworkService()
    
    var currentMediaArray = [Media]() {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    var searchArray = [Media]()
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        mainSearchBar.delegate = self
        mainSearchBar.showsCancelButton = false
  
        mainTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        requestTrending(type)
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        
        if mainSegmentTool.selectedSegmentIndex == 0 {
            
            type = .movie
        } else {
            type = .tv
        }
        requestTrending(type)
    }
    
    
    func requestTrending(_ type: VideoType) {
        NetworkMediaReq.createRequest(false, type, searchText: nil, completion: { [weak self] result in
            self?.currentMediaArray = result
        })
    }
}

