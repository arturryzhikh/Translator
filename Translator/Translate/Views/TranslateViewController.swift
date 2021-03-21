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
    let contacts = [
        
        ["Alex","Alena","Artur"],
        ["Bob","Ben","Bull"],
        ["Candy","Curt"]
        
    ]
    
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
        tableView.delaysContentTouches = false//start hangling touches immidiately
       
       
    }
}

//MARK: UITableViewDataSource
extension TranslateViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TranslationCell.description(), for: indexPath) as! TranslationCell
        let contact = contacts[indexPath.section][indexPath.row]
        cell.searchWordLabel.text = contact
        cell.translationLabel.text = "translation"
        cell.delegate = self
        cell.addButton.tag = indexPath.row
        print(cell.addButton.tag)
        cell.meaningImageView.image = #imageLiteral(resourceName: "0-2232_free-download-hd-nature-wallpapers-for-mobile-home")
        return cell
    }
    
    
}
//MARK: UITableViewDelegate

extension TranslateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
    
}
//MARK: UISearchResultsUpdating
extension TranslateViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
    
    
   
    
}

extension TranslateViewController: TranslationCellDelegate {
    
    func addButtonTapped(sender: UIButton) {
        
    }
    
    
}
