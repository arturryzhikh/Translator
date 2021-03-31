//
//  OtherWordsCell.swift
//  Translator
//
//  Created by Artur Ryzhikh on 21.03.2021.
//

import UIKit

protocol CollapsableHeaderDelegate: class {
    
    func toggleSection(header: CollapsableHeaderProtocol, section: Int)
    
}

protocol CollapsableHeaderProtocol {
    var delegate: CollapsableHeaderDelegate? { get set }
}
class TranslationHeader: UITableViewHeaderFooterView, CollapsableHeaderProtocol {
    
    
    
    var section: Int = 0
    
    weak var delegate: CollapsableHeaderDelegate?
    
    var isExpanded = false {
        
        didSet {
            rotateDisclosureLabel(isExpanded: isExpanded)
        }
        
    }
    var countLabel: UILabel!
    var searchWordLabel: UILabel!
    var translationLabel: UILabel!
    var detailDisclosureLabel: UILabel!
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    private func reset() {
        
        isExpanded = true
        countLabel.text = nil
        searchWordLabel.text = nil
        translationLabel.text = nil
        
    }
   
  
        

           
      
 
    private func setup() {
      
        let tap = UITapGestureRecognizer(target: self, action: #selector(headerTapped(gesure:)))
        addGestureRecognizer(tap)
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
        
        let stack = UIStackView(arrangedSubviews: [searchWordLabel, translationLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        self.contentView.addSubview(stack)
       
        
        detailDisclosureLabel = UILabel()
        detailDisclosureLabel.translatesAutoresizingMaskIntoConstraints = false
        detailDisclosureLabel.text = "▽"
        detailDisclosureLabel.textColor = .systemBlue
        detailDisclosureLabel.font = UIFont.systemFont(ofSize: 18,weight: .light)
        self.contentView.addSubview(detailDisclosureLabel)
            detailDisclosureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        detailDisclosureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        stack.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 16).isActive = true
        stack.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: detailDisclosureLabel.trailingAnchor, constant: -32).isActive = true
        
    
      
    }
    @objc func headerTapped(gesure: UIGestureRecognizer) {
        isExpanded.toggle()
        guard let header = gesure.view as? TranslationHeader else {
                    return
                }
        delegate?.toggleSection(header: self, section: header.section)
     
        
    }
    private func rotateDisclosureLabel(isExpanded: Bool) {
        UIView.animate(withDuration: 0.33) {
            self.detailDisclosureLabel.transform = isExpanded ?
                CGAffineTransform(rotationAngle: CGFloat.pi) : CGAffineTransform.identity
        }
        
    }
    
    
            
        
}
       
        
     
            

    
       


