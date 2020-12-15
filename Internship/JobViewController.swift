//
//  JobViewController.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/10/20.
//

import UIKit

class JobViewController: UIViewController {
    let padding: CGFloat = 28
    var jobPageImage: UIImageView!
    var jobHeaderView: UIView!
    //inside JobHeaderView
    var jobTitle: UILabel!
    var companyLabel: UILabel!
    var locationLabel: UILabel!
    var durationLabel: UILabel!
    //end of JobHeaderView
    
    var skilNeededView: UIView!
    //inside skillNeededview
    var skillTitle: UILabel!
    var skillContent: UILabel!
    //end of skillNeededview

    
    var requirementView: UIView!
    //inside requirementView
    var requirementTitle: UILabel!
    var requirementContent: UILabel!
    //end of requirementView
    
    var descriptionView: UIView!
    //inside descriptionView
    var descriptionTitle: UILabel!
    var descriptionContent: UILabel!
    //end of descriptionView
    
    
    //weak var delegate: jobDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        //title = "Student Home"
        
        jobPageImage = UIImageView()
        jobPageImage.translatesAutoresizingMaskIntoConstraints = false
        jobPageImage.contentMode = .scaleAspectFill
        jobPageImage.image = UIImage(named: "JobPostingPageImage")
        jobPageImage.layer.masksToBounds=true
        view.addSubview(jobPageImage)
        //view.sendSubviewToBack(jobPageImage)
        
        //let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
        //let myView = UIView(frame: rect)
        //jobHeaderView = UIView(frame: CGRect(x: 28, y: 220, width: 319, height: 129))
        jobHeaderView = UIView(frame: CGRect())
        //x: 28, y: 220, width: 319, height: 129
        jobHeaderView.layer.cornerRadius = 20
        jobHeaderView.translatesAutoresizingMaskIntoConstraints = false
        jobHeaderView.backgroundColor = .white
        view.addSubview(jobHeaderView)
        
        //inside JobHeaderView
        jobTitle = UILabel()
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = UIFont(name: "Rubik-Medium", size: 24)
        jobTitle.text = "UX Designer Intern"
        jobTitle.textAlignment = .left
        jobTitle.textColor = .black
        jobHeaderView.addSubview(jobTitle)
        
        companyLabel = UILabel()
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont(name: "Rubik-Light", size: 16)
        companyLabel.textAlignment = .left
        companyLabel.text = "Amazon"
        jobHeaderView.addSubview(companyLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont(name: "Rubik-Light", size: 16)
        locationLabel.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        locationLabel.text = "Irvine, CA"
        locationLabel.textAlignment = .left
        jobHeaderView.addSubview(locationLabel)
        
        durationLabel = UILabel()
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = UIFont(name: "Rubik-Light", size: 16)
        //durationLabel.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        durationLabel.text = "June - July, 2021"
        durationLabel.textAlignment = .left
        jobHeaderView.addSubview(durationLabel)
        //end of JobHeaderView

        skilNeededView = UIView(frame: CGRect())
        skilNeededView.layer.cornerRadius = 20
        skilNeededView.translatesAutoresizingMaskIntoConstraints = false
        skilNeededView.backgroundColor = .white
        view.addSubview(skilNeededView)
        //inside skillNeededview
        skillTitle = UILabel()
        skillTitle.translatesAutoresizingMaskIntoConstraints = false
        skillTitle.font = UIFont(name: "Rubik-Light", size: 16)
        skillTitle.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        skillTitle.text = "Skill Needed"
        skillTitle.textAlignment = .left
        skilNeededView.addSubview(skillTitle)
        
        skillContent = UILabel()
        skillContent.translatesAutoresizingMaskIntoConstraints = false
        skillContent.font = UIFont(name: "Rubik-Regular", size: 14)
        skillContent.text = "Python \nSQL \nR \nTableau \nMachine Learning"
        skillContent.numberOfLines = 6
        skillContent.textAlignment = .left
        skilNeededView.addSubview(skillContent)
        //end of skillNeededview
        
        
        
        requirementView = UIView(frame: CGRect())
        requirementView.layer.cornerRadius = 20
        requirementView.translatesAutoresizingMaskIntoConstraints = false
        requirementView.backgroundColor = .white
        view.addSubview(requirementView)
        //inside requirementView
        requirementTitle = UILabel()
        requirementTitle.translatesAutoresizingMaskIntoConstraints = false
        requirementTitle.font = UIFont(name: "Rubik-Light", size: 16)
        requirementTitle.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        requirementTitle.text = "Requirement"
        requirementTitle.textAlignment = .left
        requirementView.addSubview(requirementTitle)
        
        requirementContent = UILabel()
        requirementContent.translatesAutoresizingMaskIntoConstraints = false
        requirementContent.font = UIFont(name: "Rubik-Regular", size: 14)
        requirementContent.text = "GPA > 3.0 \nSenior or Master \n3+ years experience as a Data Analyst"
        requirementContent.numberOfLines = 6
        requirementContent.textAlignment = .left
        requirementView.addSubview(requirementContent)
        //end of requirementView
        
        
        
        
        descriptionView = UIView(frame: CGRect())
        descriptionView.layer.cornerRadius = 20
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.backgroundColor = .white
        view.addSubview(descriptionView)
        //inside descriptionView
        descriptionTitle = UILabel()
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.font = UIFont(name: "Rubik-Medium", size: 20)
        descriptionTitle.text = "Job Description"
        descriptionTitle.textAlignment = .left
        
        descriptionView.addSubview(descriptionTitle)
        
        
        descriptionContent = UILabel()
        descriptionContent.translatesAutoresizingMaskIntoConstraints = false
        descriptionContent.font = UIFont(name: "Rubik-Regular", size: 14)
        descriptionContent.text = "We are looking for future Amazon interns to join us for summer 2021. Amazon interns have the opportunity to work alongside the industry’s brightest designers who innovate everyday on behalf of our customers. As a UX Design Intern, you will contribute to Twitch Prime's vision, and collaborate with a team that defines and designs user interfaces, systems,... "
        descriptionContent.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        descriptionContent.numberOfLines = 30
        descriptionContent.textAlignment = .left
        
        // Get the width you want to fit
        let fixedWidth = descriptionContent.frame.size.width
        // Calculate the biggest size that fixes in the given CGSize
        let newSize = descriptionContent.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        // Set the textView's size to be whatever is bigger: The fitted width or the fixedWidth
        descriptionContent.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        // Make the "background_img_view" height match the textView's height
        descriptionView.frame.size.height = descriptionContent.frame.size.height + 50
        
        
        descriptionView.addSubview(descriptionContent)
        //end of descriptionView
        

        
        
        setupConstraints()
        
        
//        if let navController = navigationController {
//            System.clearNavigationBar(forBar: navController.navigationBar, navigationItem:navigationItem)
//            navController.view.backgroundColor = .clear
//        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            jobPageImage.topAnchor.constraint(equalTo: view.topAnchor),
            jobPageImage.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            jobPageImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            jobPageImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            jobHeaderView.topAnchor.constraint(equalTo: jobPageImage.bottomAnchor,constant: 38),
            jobHeaderView.heightAnchor.constraint(equalToConstant: 129),
            jobHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            jobHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])


        NSLayoutConstraint.activate([
            jobTitle.topAnchor.constraint(equalTo: jobHeaderView.topAnchor, constant: 20),
            jobTitle.leadingAnchor.constraint(equalTo: jobHeaderView.leadingAnchor, constant: padding),
            jobTitle.trailingAnchor.constraint(equalTo: jobHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 10),
            companyLabel.leadingAnchor.constraint(equalTo: jobHeaderView.leadingAnchor, constant: padding)
            //companyLabel.trailingAnchor.constraint(equalTo: jobHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: companyLabel.trailingAnchor, constant: 10)
            //locationLabel.trailingAnchor.constraint(equalTo: jobHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 10),
            durationLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 10),
            //locationLabel.trailingAnchor.constraint(equalTo: jobHeaderView.trailingAnchor, constant: -padding)
            ])
        
        
        
        
        //skilNeededView
        NSLayoutConstraint.activate([
            skilNeededView.topAnchor.constraint(equalTo: jobHeaderView.bottomAnchor,constant: 24),
            skilNeededView.heightAnchor.constraint(equalToConstant: 134),
            //skilNeededView.widthAnchor.constraint(equalToConstant: 160),
            skilNeededView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            skilNeededView.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            skillTitle.topAnchor.constraint(equalTo: skilNeededView.topAnchor, constant: 16),
            skillTitle.leadingAnchor.constraint(equalTo: skilNeededView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            skillContent.topAnchor.constraint(equalTo: skillTitle.bottomAnchor, constant: 5),
            skillContent.leadingAnchor.constraint(equalTo: skilNeededView.leadingAnchor, constant: 16),
            skillContent.trailingAnchor.constraint(equalTo: requirementView.trailingAnchor, constant: -16)
            ])
        
        
        
        //requirementView
        NSLayoutConstraint.activate([
            requirementView.topAnchor.constraint(equalTo: jobHeaderView.bottomAnchor,constant: 24),
            requirementView.heightAnchor.constraint(equalToConstant: 134),
            //requirementView.widthAnchor.constraint(equalToConstant: 160),
            requirementView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            requirementView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])
        NSLayoutConstraint.activate([
            requirementTitle.topAnchor.constraint(equalTo: requirementView.topAnchor, constant: 16),
            requirementTitle.leadingAnchor.constraint(equalTo: requirementView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            requirementContent.topAnchor.constraint(equalTo: requirementTitle.bottomAnchor, constant: 5),
            requirementContent.leadingAnchor.constraint(equalTo: requirementView.leadingAnchor, constant: 16),
            requirementContent.trailingAnchor.constraint(equalTo: requirementView.trailingAnchor, constant: -16)
            ])

        
        //descriptionView
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: requirementView.bottomAnchor,constant: 24),
            descriptionView.heightAnchor.constraint(equalToConstant: 200),
            //descriptionView.widthAnchor.constraint(equalToConstant: 160),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])
        NSLayoutConstraint.activate([
            descriptionTitle.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 16),
            descriptionTitle.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            descriptionContent.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 5),
            descriptionContent.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 16),
            descriptionContent.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -16)
            ])
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
