//
//  ViewController.swift
//  Translator
//
//  Created by Artur Ryzhikh on 14.03.2021.
//

import UIKit

class TranslateViewController: UIViewController {
    //MARK: Subviews
    @IBOutlet var tableView: UITableView!
    
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Type A Word To Translate"
        return sc
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        view.backgroundColor = .white
    }
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.backgroundColor = .white
    }
    private func setupTableView() {
        tableView.register(TranslationCell.self, forCellReuseIdentifier: TranslationCell.description())
    }
}


extension TranslateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TranslationCell.description(), for: indexPath) as! TranslationCell
        return cell
    }
    
    
}

extension TranslateViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
