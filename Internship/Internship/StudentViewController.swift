//
//  StudentViewController.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/7/20.
//

import UIKit
//protocol jobDelegate: class{
//    func saveEdits(loc: Int, newSong: String?, newArtist: String?, newAlbum: String?)
//}

class StudentViewController: UIViewController {
    var findYourInternText: UILabel!
    var yourProfile: UILabel!
    var profileBox: UITextView!
    var recomPosition: UILabel!
//    var studentButton: UIButton!
//    var recruiterButton: UIButton!
//    var welcomePic: UIImageView!
    let padding: CGFloat = 28
    private let searchBar = UISearchBar()
    var positionCollectionView: UICollectionView!
    var positionCellReuseIdentifier = "positionCellReuseIdentifier"
    var positionList: [Position] = []
    var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        title = "Student Home"
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false

        // Do any additional setup after loading the view.
        findYourInternText = UILabel()
        findYourInternText.translatesAutoresizingMaskIntoConstraints = false
        findYourInternText.font = UIFont(name: "Rubik-Medium", size: 25)
        findYourInternText.text = "Find your best interns."
        findYourInternText.textAlignment = .left
        findYourInternText.textColor = .black
        view.addSubview(findYourInternText)
        
        //searchBar.delegate = self
        searchBar.backgroundColor = .white
        //searchBar.backgroundImage = UIImage()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "What are you looking for?"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.font = UIFont(name: "Rubik-Light", size: 14)
        searchBar.searchTextField.clearButtonMode = .whileEditing
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        view.addSubview(searchBar)
        
        yourProfile = UILabel()
        yourProfile.translatesAutoresizingMaskIntoConstraints = false
        yourProfile.font = UIFont(name: "Rubik-Medium", size: 20)
        yourProfile.text = "Your Profile"
        yourProfile.textAlignment = .left
        yourProfile.textColor = .black
        view.addSubview(yourProfile)
        
        profileBox = UITextView()
        profileBox.translatesAutoresizingMaskIntoConstraints = false
        profileBox.textColor = .black
        profileBox.textAlignment = .left
        profileBox.font = UIFont(name: "Rubik-Regular", size: 14)
        profileBox.backgroundColor = .white
        profileBox.layer.cornerRadius = 20
        profileBox.text = """
        Daniel K
        Cornell University
        B.S. Information Science
        GPA 3.9    Prefered Position: Data Analyst
        Skills: Python, R, SQL
        UI/UX designer and front-end developer with experience designing and building web apps and a knack for creating a valuable and enjoyable user experience.
        """
        view.addSubview(profileBox)
        
        recomPosition = UILabel()
        recomPosition.translatesAutoresizingMaskIntoConstraints = false
        recomPosition.font = UIFont(name: "Rubik-Medium", size: 20)
        recomPosition.text = "Recommended Position"
        recomPosition.textAlignment = .left
        recomPosition.textColor = .black
        view.addSubview(recomPosition)
        
        

        let pos1 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        let pos2 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        let pos3 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        let pos4 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        let pos5 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        let pos6 = Position(positionPicName: "amazonLogo", positionName: "UX Designer Intern", companyName: "Amazon", locationName: "Irvine, CA", durationString: "June-July, 2020")
        
        positionList = [pos1,pos2,pos3,pos4,pos5,pos6]
       
        let positionLayout = UICollectionViewFlowLayout()
        //specify the scroll direction
        positionLayout.scrollDirection = .vertical
        //spacing between item
        positionLayout.minimumInteritemSpacing = 20
        //space between rows
        positionLayout.minimumLineSpacing = 14
        
        positionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: positionLayout)
        //reuse restaurant cell
        positionCollectionView.register(PositionCollectionViewCell.self, forCellWithReuseIdentifier: positionCellReuseIdentifier)
        positionCollectionView.dataSource = self
        positionCollectionView.delegate = self
        positionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        positionCollectionView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        view.addSubview(positionCollectionView)
     
        
        backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backButtonPress), for: .touchUpInside)
        
        
        setupConstraints()
        
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
    }
    
    @objc func backButtonPress(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            findYourInternText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            findYourInternText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            findYourInternText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])


        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: findYourInternText.bottomAnchor, constant: 22),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
            ])

        NSLayoutConstraint.activate([
            yourProfile.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 22),
            yourProfile.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            yourProfile.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])

        NSLayoutConstraint.activate([
            profileBox.topAnchor.constraint(equalTo: yourProfile.bottomAnchor, constant: 10),
            profileBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //profileBox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileBox.heightAnchor.constraint(equalToConstant: 180),
            //profileBox.widthAnchor.constraint(equalToConstant: 319),
            profileBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            profileBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])

        NSLayoutConstraint.activate([
            recomPosition.topAnchor.constraint(equalTo: profileBox.bottomAnchor, constant: 22),
            recomPosition.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            recomPosition.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            positionCollectionView.topAnchor.constraint(equalTo: recomPosition.bottomAnchor, constant: 10),
            positionCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            positionCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            positionCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

//put extensions below
extension StudentViewController: UICollectionViewDataSource {
//number of rows in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return positionList.count
        
    }
    
//populate the cell of each item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: positionCellReuseIdentifier, for: indexPath) as! PositionCollectionViewCell
        cell.configure(position: positionList[indexPath.item])
            return cell
        }
}


extension StudentViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2.0
        return CGSize(width: width, height: 107)
    }
}

//click on the cell of job posting, push job detail view
extension StudentViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let index = indexPath.item
        //let newViewController = JobViewController()
        //newViewController.delegate = self
        let vc = JobViewController()
        navigationController?.pushViewController(vc, animated: true)
        //filterCollectionView.reloadData()
        //restaurantCollectionView.reloadData()
    }
}


