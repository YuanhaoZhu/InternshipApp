//
//  StudentDetailViewController.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/14/20.
//

import UIKit

class StudentDetailViewController: UIViewController {
    let padding: CGFloat = 28
    var studentDetailHeaderPic: UIImageView!
    var studentHeaderView: UIView!
    //inside studentHeaderView
    var studentName: UILabel!
    var schoolName: UILabel!
    var locationLabel: UILabel!
    var openTimeLabel: UILabel!
    //end of studentHeaderView
    
    var studentSkillView: UIView!
    //inside studentSkillView
    var skillTitle: UILabel!
    var skillContent: UILabel!
    //end of studentSkillView

    
    var studentStatsView: UIView!
    //inside studentStatsView
    var studentStatsTitle: UILabel!
    var studentStatsContent: UILabel!
    //end of studentStatsView
    
    var selfIntroView: UIView!
    //inside selfIntroView
    var selfIntroTitle: UILabel!
    var selfIntroContent: UILabel!
    //end of selfIntroView
    
    
    //weak var delegate: jobDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        //title = "Student Home"
        
        studentDetailHeaderPic = UIImageView()
        studentDetailHeaderPic.translatesAutoresizingMaskIntoConstraints = false
        studentDetailHeaderPic.contentMode = .scaleAspectFill
        studentDetailHeaderPic.image = UIImage(named: "studentDetailHeader")
        studentDetailHeaderPic.layer.masksToBounds=true
        view.addSubview(studentDetailHeaderPic)
        //view.sendSubviewToBack(studentDetailHeaderPic)
        
        //let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
        //let myView = UIView(frame: rect)
        //studentHeaderView = UIView(frame: CGRect(x: 28, y: 220, width: 319, height: 129))
        studentHeaderView = UIView(frame: CGRect())
        //x: 28, y: 220, width: 319, height: 129
        studentHeaderView.layer.cornerRadius = 20
        studentHeaderView.translatesAutoresizingMaskIntoConstraints = false
        studentHeaderView.backgroundColor = .white
        view.addSubview(studentHeaderView)
        
        //inside studentHeaderView
        studentName = UILabel()
        studentName.translatesAutoresizingMaskIntoConstraints = false
        studentName.font = UIFont(name: "Rubik-Medium", size: 24)
        studentName.text = "UX Designer Intern"
        studentName.textAlignment = .left
        studentName.textColor = .black
        studentHeaderView.addSubview(studentName)
        
        schoolName = UILabel()
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        schoolName.font = UIFont(name: "Rubik-Light", size: 16)
        schoolName.textAlignment = .left
        schoolName.text = "Amazon"
        studentHeaderView.addSubview(schoolName)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont(name: "Rubik-Light", size: 16)
        locationLabel.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        locationLabel.text = "Irvine, CA"
        locationLabel.textAlignment = .left
        studentHeaderView.addSubview(locationLabel)
        
        openTimeLabel = UILabel()
        openTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        openTimeLabel.font = UIFont(name: "Rubik-Light", size: 16)
        //openTimeLabel.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        openTimeLabel.text = "June - July, 2021"
        openTimeLabel.textAlignment = .left
        studentHeaderView.addSubview(openTimeLabel)
        //end of studentHeaderView

        studentSkillView = UIView(frame: CGRect())
        studentSkillView.layer.cornerRadius = 20
        studentSkillView.translatesAutoresizingMaskIntoConstraints = false
        studentSkillView.backgroundColor = .white
        view.addSubview(studentSkillView)
        //inside skillNeededview
        skillTitle = UILabel()
        skillTitle.translatesAutoresizingMaskIntoConstraints = false
        skillTitle.font = UIFont(name: "Rubik-Light", size: 16)
        skillTitle.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        skillTitle.text = "Skill Needed"
        skillTitle.textAlignment = .left
        studentSkillView.addSubview(skillTitle)
        
        skillContent = UILabel()
        skillContent.translatesAutoresizingMaskIntoConstraints = false
        skillContent.font = UIFont(name: "Rubik-Regular", size: 14)
        skillContent.text = "Python \nSQL \nR \nTableau \nMachine Learning"
        skillContent.numberOfLines = 6
        skillContent.textAlignment = .left
        studentSkillView.addSubview(skillContent)
        //end of skillNeededview
        
        
        
        studentStatsView = UIView(frame: CGRect())
        studentStatsView.layer.cornerRadius = 20
        studentStatsView.translatesAutoresizingMaskIntoConstraints = false
        studentStatsView.backgroundColor = .white
        view.addSubview(studentStatsView)
        //inside studentStatsView
        studentStatsTitle = UILabel()
        studentStatsTitle.translatesAutoresizingMaskIntoConstraints = false
        studentStatsTitle.font = UIFont(name: "Rubik-Light", size: 16)
        studentStatsTitle.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        studentStatsTitle.text = "Requirement"
        studentStatsTitle.textAlignment = .left
        studentStatsView.addSubview(studentStatsTitle)
        
        studentStatsContent = UILabel()
        studentStatsContent.translatesAutoresizingMaskIntoConstraints = false
        studentStatsContent.font = UIFont(name: "Rubik-Regular", size: 14)
        studentStatsContent.text = "GPA > 3.0 \nSenior or Master \n3+ years workingexperience as a Data Analyst"
        studentStatsContent.numberOfLines = 6
        studentStatsContent.textAlignment = .left
        studentStatsView.addSubview(studentStatsContent)
        //end of studentStatsView
        
        
        
        
        selfIntroView = UIView(frame: CGRect())
        selfIntroView.layer.cornerRadius = 20
        selfIntroView.translatesAutoresizingMaskIntoConstraints = false
        selfIntroView.backgroundColor = .white
        view.addSubview(selfIntroView)
        //inside selfIntroView
        selfIntroTitle = UILabel()
        selfIntroTitle.translatesAutoresizingMaskIntoConstraints = false
        selfIntroTitle.font = UIFont(name: "Rubik-Medium", size: 20)
        selfIntroTitle.text = "Job Description"
        selfIntroTitle.textAlignment = .left
        
        selfIntroView.addSubview(selfIntroTitle)
        
        
        selfIntroContent = UILabel()
        selfIntroContent.translatesAutoresizingMaskIntoConstraints = false
        selfIntroContent.font = UIFont(name: "Rubik-Regular", size: 14)
        selfIntroContent.text = "We are looking for future Amazon interns to join us for summer 2021. Amazon interns have the opportunity to work alongside the industry’s brightest designers who innovate everyday on behalf of our customers. As a UX Design Intern, you will contribute to Twitch Prime's vision, and collaborate with a team that defines and designs user interfaces, systems, and interaction, visual, motion, and voice design patterns. "
        selfIntroContent.textColor = #colorLiteral(red: 0.6431372549, green: 0.6352941176, blue: 0.6352941176, alpha: 1)
        selfIntroContent.numberOfLines = 30
        selfIntroContent.textAlignment = .left
        
        // Get the width you want to fit
        let fixedWidth = selfIntroContent.frame.size.width
        // Calculate the biggest size that fixes in the given CGSize
        let newSize = selfIntroContent.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        // Set the textView's size to be whatever is bigger: The fitted width or the fixedWidth
        selfIntroContent.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        // Make the "background_img_view" height match the textView's height
        selfIntroView.frame.size.height = selfIntroContent.frame.size.height + 50
        
        
        selfIntroView.addSubview(selfIntroContent)
        //end of selfIntroView
        

        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            studentDetailHeaderPic.topAnchor.constraint(equalTo: view.topAnchor),
            studentDetailHeaderPic.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            studentDetailHeaderPic.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            studentDetailHeaderPic.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            studentHeaderView.topAnchor.constraint(equalTo: studentDetailHeaderPic.bottomAnchor,constant: 38),
            studentHeaderView.heightAnchor.constraint(equalToConstant: 129),
            studentHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            studentHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])


        NSLayoutConstraint.activate([
            studentName.topAnchor.constraint(equalTo: studentHeaderView.topAnchor, constant: 20),
            studentName.leadingAnchor.constraint(equalTo: studentHeaderView.leadingAnchor, constant: padding),
            studentName.trailingAnchor.constraint(equalTo: studentHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            schoolName.topAnchor.constraint(equalTo: studentName.bottomAnchor, constant: 10),
            schoolName.leadingAnchor.constraint(equalTo: studentHeaderView.leadingAnchor, constant: padding)
            //schoolName.trailingAnchor.constraint(equalTo: studentHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: studentName.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: schoolName.trailingAnchor, constant: 10)
            //locationLabel.trailingAnchor.constraint(equalTo: studentHeaderView.trailingAnchor, constant: -padding)
            ])
        NSLayoutConstraint.activate([
            openTimeLabel.topAnchor.constraint(equalTo: studentName.bottomAnchor, constant: 10),
            openTimeLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 10),
            //locationLabel.trailingAnchor.constraint(equalTo: studentHeaderView.trailingAnchor, constant: -padding)
            ])
        
        
        
        
        //studentSkillView
        NSLayoutConstraint.activate([
            studentSkillView.topAnchor.constraint(equalTo: studentHeaderView.bottomAnchor,constant: 24),
            studentSkillView.heightAnchor.constraint(equalToConstant: 134),
            //studentSkillView.widthAnchor.constraint(equalToConstant: 160),
            studentSkillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            studentSkillView.trailingAnchor.constraint(equalTo: view.centerXAnchor,constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            skillTitle.topAnchor.constraint(equalTo: studentSkillView.topAnchor, constant: 16),
            skillTitle.leadingAnchor.constraint(equalTo: studentSkillView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            skillContent.topAnchor.constraint(equalTo: skillTitle.bottomAnchor, constant: 5),
            skillContent.leadingAnchor.constraint(equalTo: studentSkillView.leadingAnchor, constant: 16),
            skillContent.trailingAnchor.constraint(equalTo: studentStatsView.trailingAnchor, constant: -16)
            ])
        
        
        
        //studentStatsView
        NSLayoutConstraint.activate([
            studentStatsView.topAnchor.constraint(equalTo: studentHeaderView.bottomAnchor,constant: 24),
            studentStatsView.heightAnchor.constraint(equalToConstant: 134),
            //studentStatsView.widthAnchor.constraint(equalToConstant: 160),
            studentStatsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            studentStatsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])
        NSLayoutConstraint.activate([
            studentStatsTitle.topAnchor.constraint(equalTo: studentStatsView.topAnchor, constant: 16),
            studentStatsTitle.leadingAnchor.constraint(equalTo: studentStatsView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            studentStatsContent.topAnchor.constraint(equalTo: studentStatsTitle.bottomAnchor, constant: 5),
            studentStatsContent.leadingAnchor.constraint(equalTo: studentStatsView.leadingAnchor, constant: 16),
            studentStatsContent.trailingAnchor.constraint(equalTo: studentStatsView.trailingAnchor, constant: -16)
            ])

        
        //selfIntroView
        NSLayoutConstraint.activate([
            selfIntroView.topAnchor.constraint(equalTo: studentStatsView.bottomAnchor,constant: 24),
            selfIntroView.heightAnchor.constraint(equalToConstant: 200),
            //selfIntroView.widthAnchor.constraint(equalToConstant: 160),
            selfIntroView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            selfIntroView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])
        NSLayoutConstraint.activate([
            selfIntroTitle.topAnchor.constraint(equalTo: selfIntroView.topAnchor, constant: 16),
            selfIntroTitle.leadingAnchor.constraint(equalTo: selfIntroView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            selfIntroContent.topAnchor.constraint(equalTo: selfIntroTitle.bottomAnchor, constant: 5),
            selfIntroContent.leadingAnchor.constraint(equalTo: selfIntroView.leadingAnchor, constant: 16),
            selfIntroContent.trailingAnchor.constraint(equalTo: selfIntroView.trailingAnchor, constant: -16)
            ])
    


}
}
