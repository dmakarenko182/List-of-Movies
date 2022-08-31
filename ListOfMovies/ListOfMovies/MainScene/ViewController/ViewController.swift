//
//  ViewController.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import UIKit

protocol AlertProvider: AnyObject {
    func presentAlert(_ text: String)
}

class ViewController: UIViewController {
    
    lazy var model = Model()
    let cellId = "CustomTableViewCell"
    @IBOutlet weak var movieTitleField: UITextField!
    @IBOutlet weak var movieYearField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        model.view = self
        mainTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

    @IBAction func addButtonTap(_ sender: Any) {
        guard let movieTitle = movieTitleField.text else {return}
        guard let movieYear = movieYearField.text else {return}
        model.addNewText(movieTitle, movieYear)
        mainTableView.reloadData()
    }
}
extension ViewController: AlertProvider {
    func presentAlert(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
