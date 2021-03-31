//
//  ViewController.swift
//  Translator
//
//  Created by Artur Ryzhikh on 14.03.2021.
//

import UIKit

struct Section {
  var name: String
  var items: [String]
  var isExpanded: Bool = false
    
  init(name: String, items: [String], collapsed: Bool = false) {
    self.name = name
    self.items = items
    self.isExpanded = collapsed
  }
}



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
    
    var sections = [
        Section(name: "A", items: ["Artur","Alena","Alex"]),
        Section(name: "B", items: ["Bob","Bryan","Book"]),
        Section(name: "C", items: ["Cindy","Carrot","Cat"])
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
        tableView.delaysContentTouches = false//start hangling touches immidiately
        tableView.register(TranslationCell.self, forCellReuseIdentifier: TranslationCell.description())
        tableView.register(TranslationHeader.self, forHeaderFooterViewReuseIdentifier: TranslationHeader.description())
       
    }
}

//MARK: UITableViewDataSource
extension TranslateViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].isExpanded ? sections[section].items.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TranslationCell.description(), for: indexPath) as! TranslationCell
        cell.translationLabel.text = "translatioin"
        cell.searchWordLabel.text = sections[indexPath.section].items[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}
//MARK: UITableViewDelegate

extension TranslateViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TranslationHeader.description()) as! TranslationHeader
        header.countLabel.text = String(sections[section].items.count)
        header.isExpanded = sections[section].isExpanded
        header.section = section
        header.delegate = self
        header.translationLabel.text = "section: \(section)"
        return header
        
    }
    
}

//MARK: UISearchResultsUpdating


extension TranslateViewController: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
   
    
}

extension TranslateViewController: TranslationCellDelegate {
    
    func addButtonTapped(sender: UIButton) {
        print(#function)
    }
    
    
}
//MARK: CollapsableHeaderDelegate
extension TranslateViewController: CollapsableHeaderDelegate {
    
    
    func toggleSection(header: CollapsableHeaderProtocol, section: Int) {
       if let header = header as? TranslationHeader {
            print(header.section)
            sections[section].isExpanded.toggle()
            tableView.reloadSections([section], with: .automatic)
        }
        
    
    }
    
    
    
    
    
  
}
