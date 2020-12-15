//
//  RecruiterViewController.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/7/20.
//

import UIKit

class RecruiterViewController: UIViewController{
    var findYourInternText: UILabel!
    var recomPosition: UILabel!
//    var studentButton: UIButton!
//    var recruiterButton: UIButton!
//    var welcomePic: UIImageView!
    let padding: CGFloat = 28
    private let searchBar = UISearchBar()
    var filterCollectionView: UICollectionView!
    var ApplicantCollectionView: UICollectionView!
    var applicantCellReuseIdentifier = "applicantCellReuseIdentifier"
    var filterCellReuseIdentifier = "filterCellReuseIdentifier"
    var positionList: [Position] = []
    var backButton: UIButton!
    private var studentList: [Student] = []


    
    init(studentList: [Student]) {
        super.init(nibName: nil, bundle: nil)
        self.studentList = studentList
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        title = "Recruiter Home"
        
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
        
        recomPosition = UILabel()
        recomPosition.translatesAutoresizingMaskIntoConstraints = false
        recomPosition.font = UIFont(name: "Rubik-Medium", size: 20)
        recomPosition.text = "Recommended Candidates"
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
       
        let applicantLayout = UICollectionViewFlowLayout()
        //specify the scroll direction
        applicantLayout.scrollDirection = .vertical
        //spacing between item
        applicantLayout.minimumInteritemSpacing = 20
        //space between rows
        applicantLayout.minimumLineSpacing = 14
        
    
        ApplicantCollectionView = UICollectionView(frame: .zero, collectionViewLayout: applicantLayout)
        //reuse restaurant cell
        ApplicantCollectionView.register(ApplicantCollectionViewCell.self, forCellWithReuseIdentifier: applicantCellReuseIdentifier)
        ApplicantCollectionView.dataSource = self
        ApplicantCollectionView.delegate = self
        ApplicantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ApplicantCollectionView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        view.addSubview(ApplicantCollectionView)
        
        let filterLayout = UICollectionViewFlowLayout()
        //specify the scroll direction
        filterLayout.scrollDirection = .horizontal
        //spacing between item
        filterLayout.minimumInteritemSpacing = 10
        //space between rows
        filterLayout.minimumLineSpacing = 10
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        //reuse restaurant cell
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        view.addSubview(filterCollectionView)
        
        
        
        backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(backButtonPress), for: .touchUpInside)
        
        getStudents()
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
            recomPosition.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 22),
            recomPosition.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            recomPosition.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: recomPosition.bottomAnchor, constant: 17),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            filterCollectionView.heightAnchor.constraint(equalToConstant:30)
        ])
        
        NSLayoutConstraint.activate([
            ApplicantCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 17),
            ApplicantCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            ApplicantCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            ApplicantCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
   
    private func getStudents() {
        NetworkManager.getStudents { (students) in
            self.studentList = students
            //self.ApplicantCollectionView.reloadData()
            DispatchQueue.main.async {
                self.ApplicantCollectionView.reloadData()
                print("123")
                print(students)
            }
        }
    }
}

//put extensions below
extension RecruiterViewController: UICollectionViewDataSource {
//number of rows in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ApplicantCollectionView {
            //need to change to applicant later..
            return studentList.count
        }
        //need to change to filter later
        return 4
    }

    

    
//populate the cell of each item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ApplicantCollectionView {
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: applicantCellReuseIdentifier, for: indexPath) as! ApplicantCollectionViewCell
            cell.configure(student: studentList[indexPath.item])
            return cell
        }
        else{
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
        cell.configure()
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
            return cell
        }
        }
}


extension RecruiterViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.ApplicantCollectionView {
            let width = (collectionView.frame.width - 20) / 2.0
            return CGSize(width: width, height: 107)
        }
        else{
            //let width = (collectionView.frame.width - 20) / 2.0
            return CGSize(width: 100, height: 30)
        }
    }
}

//click on the cell of student
extension RecruiterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.ApplicantCollectionView {
            let student = studentList[indexPath.count]
            //let student = studentList[0]
            let vc = StudentDetailViewController(student: student)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension RecruiterViewController:  UISearchBarDelegate {
    // EXTRA CREDIT TODO: Complete functions to search restaurants
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /* Instructions: Make a call to searchRestaurants function inside of NetworkManager,
         * passing searchText as an argument. If function is written correctly, the function
         * should return an array of retaurants. Inside completion handler block, set
         * restaurants array in this class to the returned restaurants array and then reload
         * restaurants table view.
         */
        NetworkManager.searchStudents(name: searchText) { (students) in
            self.studentList = students
            self.ApplicantCollectionView.reloadData()
        }
    }
}
