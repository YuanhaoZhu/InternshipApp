//
//  FilterCollectionViewCell.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/12/20.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    var filterLabel: UILabel!    
    //need to override
    
    override var isSelected: Bool{
        didSet {
            if isSelected == true{
                filterLabel.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.8509803922, blue: 0.2823529412, alpha: 1)
            }
            else{
                filterLabel.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        //choose the content mode of the image.
        filterLabel.font = UIFont(name: "Rubik-Light", size: 14)
        filterLabel.textAlignment = .center
        contentView.addSubview(filterLabel)
        
        setupConstraints()
    }

    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure() {
        filterLabel.text = "Filter"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


