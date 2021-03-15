//
//  ViewController.swift
//  Translator
//
//  Created by Artur Ryzhikh on 14.03.2021.
//

import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
