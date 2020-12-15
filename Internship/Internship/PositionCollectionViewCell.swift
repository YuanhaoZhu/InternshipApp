//
//  PositionCollectionViewCell.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/8/20.
//

import UIKit

class PositionCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var positionNameLabel: UILabel!
    var companyLabel: UILabel!
    var locationLabel: UILabel!
    var durationLabel: UILabel!
    


    //need to override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
        
        positionNameLabel = UILabel()
        positionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        positionNameLabel.font = UIFont(name: "Rubik-Regualr", size: 14)
        positionNameLabel.textAlignment = .left
        positionNameLabel.numberOfLines = 2
        contentView.addSubview(positionNameLabel)
        
        companyLabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont(name: "Rubik-Light", size: 14)
        companyLabel.textAlignment = .left
        contentView.addSubview(companyLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont(name: "Rubik-Light", size: 14)
        locationLabel.textAlignment = .left
        contentView.addSubview(locationLabel)
        
        durationLabel = UILabel()
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = UIFont(name: "Rubik-Light", size: 14)
        durationLabel.textAlignment = .left
        contentView.addSubview(durationLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            //imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -110),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            positionNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            positionNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            positionNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            companyLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            companyLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            companyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 1),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 1),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
    }
    
    func configure(position:Position) {
        imageView.image = UIImage(named: position.positionPicName)
        positionNameLabel.text = "UX Designer Intern"
        companyLabel.text = "Amazon"
        locationLabel.text = "Irvine, CA"
        durationLabel.text = "June - July, 2021"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
