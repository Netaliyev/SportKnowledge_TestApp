import UIKit

class ProfileViewController: UIViewController {
    
    let backgroundIV = UIImageView(image: UIImage(named: "profileBackground"))
    
    let homeProfileLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let notificationSwitch = UISwitch()
    let cellNames = [
        "Notifications",
        "Rate Us",
        "Leave Feedback",
        "Privacy Policy",
        "Term Of Use"
    ]
    let rectangleView = UIImageView(image: UIImage(named: "profileRectangleView"))
    
    let leftLabels: [UILabel] = {
        var result = [UILabel]()
        for _ in 0..<3 {
            let label = UILabel()
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 21)
            result.append(label)
        }
        return result
    }()
    let rightLabels: [UILabel] = {
       var result = [UILabel]()
        for _ in 0..<3 {
            let label = UILabel()
            label.textColor = .init(red: 180/255, green: 130/255, blue: 36/255, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 25)
            result.append(label)
        }
        return result
    }()
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    let profileStackView = UIStackView()
    let editButton = UIButton()
    let deleteButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)

        configureUI()
        tableViewSetup()
    }
    
    func configureUI() {
        configureBackgroundIV()
        configureProfileLabel()
        configureTableView()
        configureRectangle()
        configureNameAgeLabels()
        configureEditButton()
        configureDeleteButton()
    }
    
    fileprivate func tableViewSetup() {
        //TableView Configuration
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.alwaysBounceVertical = false
        tableView.rowHeight = view.bounds.height/14
        tableView.isScrollEnabled = false
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell else {
            fatalError("incorrect table view cell")
        }
        if indexPath.section == 0 {
            cell.contentView.addSubview(notificationSwitch)
            notificationSwitch.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                notificationSwitch.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                notificationSwitch.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -15)
            ])
            notificationSwitch.onTintColor = .orange
        } else {
            let arrowIV = UIImageView(image: UIImage(named: "cellArrow"))
            cell.contentView.addSubview(arrowIV)
            arrowIV.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                arrowIV.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                arrowIV.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                arrowIV.widthAnchor.constraint(equalToConstant: 20),
                arrowIV.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
        cell.configureLabel(text: cellNames[indexPath.section])
        return cell
    }
    
    //TODO: add navigation controller movement to new vc
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
//        case 1: navigationController?.pushViewController(StatisticViewController(), animated: true)
        default: break
        }
    }
}

extension ProfileViewController {
    @objc func editAction() {
        let editViewController = EditProfileViewController()
        editViewController.delegate = self
        present(editViewController, animated: true)
    }
    
    @objc func deleteAction() {
        tabBarController?.parent?.willMove(toParent: nil)
        tabBarController?.parent?.view.removeFromSuperview()
        tabBarController?.parent?.removeFromParent()
        UserDefaults.standard.removeObject(forKey: "name")
        for i in 0..<12 {
            sportEnum.allCases.forEach { sport in
                topicEnum.allCases.forEach { topic in
                    UserDefaults.standard.removeObject(forKey: "correctAnswers\(sport.rawValue)\(topic.rawValue)\(i)")
                    UserDefaults.standard.removeObject(forKey: "correctStat\(sport.rawValue)\(topic.rawValue)\(i)")
                    UserDefaults.standard.removeObject(forKey: "wrongStat\(sport.rawValue)\(topic.rawValue)\(i)")
                    UserDefaults.standard.removeObject(forKey: "achievement\(sport.rawValue)\(topic.rawValue)")
                    UserDefaults.standard.removeObject(forKey: "isStudyCompleted\(sport.rawValue)\(topic.rawValue)\(i)")
                    UserDefaults.standard.removeObject(forKey: "isTestCompleted\(sport.rawValue)\(topic.rawValue)\(i)")

                }
            }
        }
    }
}

extension ProfileViewController: EditProfileDelegate {
    func applyChanges() {
        configureNameAgeLabels()
    }
}
