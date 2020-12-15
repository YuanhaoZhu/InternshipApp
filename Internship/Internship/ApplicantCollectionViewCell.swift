//
//  ApplicantCollectionViewCell.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/12/20.
//

import UIKit

class ApplicantCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var studentNameLabel: UILabel!
    var schoolLabel: UILabel!
    var preferedPositionLabel: UILabel!
    var locationLabel: UILabel!
    var durationLabel: UILabel!
    
////    init(studentNameLabel: [String]) {
////        super.init(nibName: nil, bundle: nil)
////        self.studentNameLabel =
////    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

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
        
        studentNameLabel = UILabel()
        studentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        studentNameLabel.font = UIFont(name: "Rubik-Regualr", size: 14)
        studentNameLabel.textAlignment = .left
        contentView.addSubview(studentNameLabel)
        
        
        schoolLabel = UILabel()
        schoolLabel.translatesAutoresizingMaskIntoConstraints = false
        schoolLabel.font = UIFont(name: "Rubik-Regualr", size: 14)
        schoolLabel.textAlignment = .left
        contentView.addSubview(schoolLabel)
        
        preferedPositionLabel = UILabel()
        preferedPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        preferedPositionLabel.font = UIFont(name: "Rubik-Light", size: 14)
        preferedPositionLabel.textAlignment = .left
        contentView.addSubview(preferedPositionLabel)
        
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
            studentNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            studentNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            studentNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            schoolLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            schoolLabel.topAnchor.constraint(equalTo: studentNameLabel.bottomAnchor, constant: 0),
            schoolLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            preferedPositionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            preferedPositionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            preferedPositionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: preferedPositionLabel.bottomAnchor, constant: 1),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            durationLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 1),
            durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
        ])
    }
    
    func configure(student:Student) {
        imageView.image = UIImage(named: "profilePic")
        studentNameLabel.text = student.name
        schoolLabel.text = "Cornell University"
        preferedPositionLabel.text = "UX Designer"
        locationLabel.text = student.location
        durationLabel.text = "\(student.startMonth)" + "-" + "\(student.endMonth)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


