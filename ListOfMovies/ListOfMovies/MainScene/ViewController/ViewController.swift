//
//  ViewController.swift
//  ListOfMovies
//
//  Created by Danylo Makarenko on 31.08.2022.
//

import UIKit

protocol View: AnyObject {
    func presentAlert(_ text: String)
    func updateMovies(_ movies: [MovieModel])
}

class ViewController: UIViewController {
    //MARK: Properites
    private lazy var model: Model = {
        let model = Model()
        model.view = self
        return model
    }()
   
    private var dataSource: UITableViewDiffableDataSource<Section, MovieModel>?

    
    //MARK: Outlets
    @IBOutlet private weak var movieTitleField: UITextField!
    @IBOutlet private weak var movieYearField: UITextField!
    @IBOutlet private weak var mainTableView: UITableView!
    
    //MARK: VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpDataSource()
       
    }
    
    @IBAction private func addButtonTap(_ sender: Any) {
        guard let movieTitle = movieTitleField.text else { return }
        guard let movieYear = movieYearField.text else { return }
        model.addMovie(movieTitle, movieYear)
        
        
    }
    // MARK: Setting DataSource and setting up the cell
    private func setUpTableView() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: .main)
        mainTableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func setUpDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: mainTableView) { tableView, indexPath, movie in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.configure(with: movie)
            return cell
        }
    }
    
    private func applySnapshot(movies: [MovieModel]) {
        guard let dataSource = dataSource else { return }
        
        var snapshot = dataSource.snapshot()
        let section = Section.main
        snapshot.appendSections([section])
        
        snapshot.appendItems(movies, toSection: section)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: Extension
extension ViewController: View {
    func updateMovies(_ movies: [MovieModel]) {
        applySnapshot(movies: movies)
    }
    
    func presentAlert(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
