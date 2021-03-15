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
        sc.searchBar.placeholder = "Type a word to translate"
        return sc
        
    }()
    
    //MARK: Instance variables
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    //MARK: Setup Subviews
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    private func setupTableView() {
        tableView.register(TranslationCell.self, forCellReuseIdentifier: TranslationCell.description())
    }
}

//MARK: UITableViewDataSource
extension TranslateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TranslationCell.description(), for: indexPath) as! TranslationCell
        return cell
    }
    
    
}
//MARK: UISearchResultsUpdating
extension TranslateViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
    
    
}
