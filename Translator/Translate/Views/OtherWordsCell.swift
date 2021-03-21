//
//  OtherWordsCell.swift
//  Translator
//
//  Created by Artur Ryzhikh on 21.03.2021.
//

import UIKit

class OtherWordsCell: UITableViewCell {
    
    var isExpanded = false {
        didSet {
            rotateDisclosureLabel(cw: isExpanded)
        }
    }
    var countLabel: UILabel!
    var searchWordLabel: UILabel!
    var translationLabel: UILabel!
    var detailDisclosureLabel: UILabel!
    weak var delegate: TranslationCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        isExpanded = true
        countLabel.text = nil
        searchWordLabel.text = nil
        translationLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            isExpanded.toggle()
        }
        
    }
    
    private func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
        countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.backgroundColor = #colorLiteral(red: 0.8751707026, green: 0.8751707026, blue: 0.8751707026, alpha: 1)
        countLabel.layer.cornerRadius = 8
        countLabel.layer.masksToBounds = true
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 24, weight: .light)
        countLabel.textColor = .systemBlue
        self.contentView.addSubview(countLabel)
        countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        countLabel.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.75).isActive = true
        countLabel.widthAnchor.constraint(equalTo: countLabel.heightAnchor).isActive = true
        
        searchWordLabel = UILabel()
        searchWordLabel.translatesAutoresizingMaskIntoConstraints = false
        searchWordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.addSubview(searchWordLabel)
        
        translationLabel = UILabel()
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        translationLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.addSubview(translationLabel)
        
        let stack = UIStackView(arrangedSubviews: [searchWordLabel,translationLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        self.contentView.addSubview(stack)
       
        
        detailDisclosureLabel = UILabel()
        detailDisclosureLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDisclosureLabel.text = "▷"
        detailDisclosureLabel.textColor = .systemBlue
        detailDisclosureLabel.font = UIFont.systemFont(ofSize: 18,weight: .light)
        self.contentView.addSubview(detailDisclosureLabel)
            detailDisclosureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        detailDisclosureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        stack.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 16).isActive = true
        stack.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: detailDisclosureLabel.trailingAnchor, constant: -32).isActive = true
        
    
      
    }
    
    private func rotateDisclosureLabel(cw: Bool) {
        UIView.animate(withDuration: 0.33) {
            self.detailDisclosureLabel.transform = cw ?
                CGAffineTransform(rotationAngle: CGFloat.pi / 2) : CGAffineTransform.identity
        }
        
    }
    
    
            
        
}
       
        
     
            

    
       


