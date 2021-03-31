//
//  TranslationCell.swift
//  Translator
//
//  Created by Artur Ryzhikh on 21.03.2021.
//

import UIKit

protocol TranslationCellDelegate: class {
    
    func addButtonTapped(sender: UIButton)
    
}

class TranslationCell: UITableViewCell {
    
    
    var isFavorite: Bool = false {
        didSet  {
            if isFavorite {
                self.addButton.removeFromSuperview()
                addStarFavoritesLabel()
            }
        }
    }
    
    var meaningImageView: UIImageView!
    
    var searchWordLabel: UILabel!
    
    var translationLabel: UILabel!
    
    var addButton: UIButton!
    
    weak var delegate: TranslationCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 0.8751707026, green: 0.8751707026, blue: 0.8751707026, alpha: 1)
        self.clipsToBounds = true
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
        meaningImageView = UIImageView()
        meaningImageView.translatesAutoresizingMaskIntoConstraints = false
        meaningImageView.contentMode = .scaleAspectFill
        meaningImageView.backgroundColor = .yellow
        meaningImageView.layer.cornerRadius = 8
        meaningImageView.layer.masksToBounds = true
        self.contentView.addSubview(meaningImageView)
        meaningImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        meaningImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        meaningImageView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.75).isActive = true
        meaningImageView.widthAnchor.constraint(equalTo: meaningImageView.heightAnchor,multiplier: 1.33).isActive = true
        searchWordLabel = UILabel()
        searchWordLabel.translatesAutoresizingMaskIntoConstraints = false
        searchWordLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.addSubview(searchWordLabel)
        translationLabel = UILabel()
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        self.addSubview(translationLabel)
        let stack = UIStackView(arrangedSubviews: [searchWordLabel,translationLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        self.addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: meaningImageView.trailingAnchor, constant: 16).isActive = true
        stack.centerYAnchor.constraint(equalTo: meaningImageView.centerYAnchor).isActive = true
        setupAddButton()
    }
    private func setupAddButton() {
        addButton = UIButton(type: .contactAdd)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        self.contentView.addSubview(addButton)
        addButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    private func addStarFavoritesLabel()  {
        let label = UILabel()
        label.text = "★"
        label.font = UIFont.systemFont(ofSize: 24)
        label.contentMode = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc func addButtonTapped(sender: UIButton) {
        isFavorite.toggle()
        UIView.animate(withDuration: 0.3) {
            self.addButton.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.addButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.delegate?.addButtonTapped(sender: sender)
        }
        
       
    }
}

