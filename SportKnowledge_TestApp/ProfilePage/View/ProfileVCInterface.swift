import UIKit

extension ProfileViewController {
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/2),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configureProfileLabel() {
        view.addSubview(homeProfileLabel)
        homeProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeProfileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
            ]
        homeProfileLabel.attributedText = NSAttributedString(string: "PROFILE", attributes: strokeTextAttributes)
        homeProfileLabel.font = UIFont.systemFont(ofSize: 80)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: homeProfileLabel.bottomAnchor, constant: -50),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: view.bounds.height/2),
            tableView.widthAnchor.constraint(equalToConstant: 320)
        ])
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.sectionFooterHeight = 5
        tableView.sectionHeaderHeight = 5
    }
    
    func configureRectangle() {
        view.addSubview(rectangleView)
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
        rectangleView.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0),
            rectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            rectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangleView.heightAnchor.constraint(equalToConstant: view.bounds.height/3.3)
        ])
        
    }
    
    func configureNameAgeLabels() {
        leftLabels.forEach { leftStackView.addArrangedSubview($0) }
        rightLabels.forEach { rightStackView.addArrangedSubview($0) }
        
        leftStackView.axis = .vertical
        rightStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        rightStackView.distribution = .fillEqually

        profileStackView.addArrangedSubview(leftStackView)
        profileStackView.addArrangedSubview(rightStackView)
        profileStackView.distribution = .fillProportionally
        
        rectangleView.addSubview(profileStackView)
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileStackView.topAnchor.constraint(equalTo: rectangleView.topAnchor, constant: 25),
            profileStackView.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 45),
            profileStackView.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -50),
            profileStackView.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -80)
        ])
        
        leftLabels[0].text = "Name:"
        leftLabels[1].text = "Age:"
        leftLabels[2].text = "Gender:  "
        
        rightLabels[0].text = UserDefaults.standard.string(forKey: "name")!
        rightLabels[1].text = String(UserDefaults.standard.integer(forKey: "age"))
        rightLabels[2].text =  {
            switch UserDefaults.standard.integer(forKey: "gender") {
            case 0:
                return "Male"
            case 1:
                return "Female"
            default:
                return "Other"
            }
        }()
    }
    
    func configureEditButton() {
        rectangleView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editButton.bottomAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -55),
            editButton.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -45),
            editButton.widthAnchor.constraint(equalToConstant: 70),
            editButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        editButton.setImage(UIImage(named: "profileIcon"), for: .normal)
        editButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
    }
    
    func configureDeleteButton() {
        view.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: -40),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 200),
            deleteButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        deleteButton.setImage(UIImage(named: "deleteButton"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
    }
}
