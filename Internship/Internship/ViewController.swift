//
//  ViewController.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/7/20.
//

import UIKit

class ViewController: UIViewController {

    //create 2 button on the home screen
    var welcomeQus: UILabel!
    var studentButton: UIButton!
    var recruiterButton: UIButton!
    var welcomePic: UIImageView!
    let padding: CGFloat = 28

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        title = "Welcome"

        
        welcomeQus = UILabel()
        welcomeQus.translatesAutoresizingMaskIntoConstraints = false
        welcomeQus.font = UIFont(name: "Rubik-Medium", size: 25)
        welcomeQus.text = "Are you a ..."
        welcomeQus.textAlignment = .left
        welcomeQus.textColor = .black
        view.addSubview(welcomeQus)
        
        //style student button
        studentButton = UIButton()
        studentButton.translatesAutoresizingMaskIntoConstraints = false
        studentButton.setTitle("Student", for: .normal)
        studentButton.setTitleColor(.black, for: .normal)
        studentButton.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 25)
        studentButton.backgroundColor = .white
        studentButton.layer.cornerRadius = 20
        studentButton.addTarget(self, action: #selector(pushStudentPage), for: .touchUpInside)
        view.addSubview(studentButton)

        //style recruiter button
        recruiterButton = UIButton()
        recruiterButton.translatesAutoresizingMaskIntoConstraints = false
        recruiterButton.setTitle("Recruiter", for: .normal)
        recruiterButton.setTitleColor(.black, for: .normal)
        recruiterButton.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 25)
        recruiterButton.backgroundColor = .white
        recruiterButton.layer.cornerRadius = 20
        recruiterButton.addTarget(self, action: #selector(pushRecruiterPage), for: .touchUpInside)
        view.addSubview(recruiterButton)
        
        welcomePic = UIImageView()
        welcomePic.translatesAutoresizingMaskIntoConstraints = false
        welcomePic.contentMode = .scaleAspectFill
        welcomePic.image = UIImage(named: "welcomePic")
        welcomePic.layer.masksToBounds=true
        view.addSubview(welcomePic)
        view.sendSubviewToBack(welcomePic)

        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeQus.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 104),
            //welcomeQus.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -600),
            welcomeQus.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            welcomeQus.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])

        
        NSLayoutConstraint.activate([
            studentButton.topAnchor.constraint(equalTo: welcomeQus.bottomAnchor, constant: 42),
            studentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentButton.heightAnchor.constraint(equalToConstant: 79),
            studentButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            studentButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            recruiterButton.topAnchor.constraint(equalTo: studentButton.bottomAnchor, constant: padding),
            recruiterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recruiterButton.heightAnchor.constraint(equalToConstant: 79),
            recruiterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            recruiterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            welcomePic.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            welcomePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomePic.heightAnchor.constraint(equalToConstant: 312),
            welcomePic.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -12),
            welcomePic.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 12)
            ])
    }
    
    //button click to student page
    @objc func pushStudentPage() {
        let vc = StudentViewController()
        //let vc = StudentViewController(delegate: self, titleString: studentButton.titleLabel?.text)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //button click to recruiter page
    @objc func pushRecruiterPage() {
        let vc = RecruiterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

