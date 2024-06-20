//
//  QuestionListViewController.swift
//  SportKnowledge_TestApp
//
//  Created by Nadir Netaliyev on 15.02.2024.
//

import UIKit

class QuestionListViewController: UIViewController {
    
    var selectedSport: sportEnum = .football
    var selectedTopic: topicEnum = .clubs
    var selectedOption = StudyTestEnum.study
    let headLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "topicBackground"))
    let backButton = UIButton()

    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
        configureUI()
        tableViewSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func configureUI() {
        configureHeadLabel()
        configureBackgroundIV()
        configureTableView()
        configureBackButton()
        
    }
    
    func tableViewSetup() {
        tableView.register(QuestionListTableViewCell.self, forCellReuseIdentifier: "QuestionListCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
//        tableView.setContentOffset(CGPointMake(0, 60), animated: true)
    }
    
    //MARK: Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension QuestionListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell", for: indexPath) as? QuestionListTableViewCell else { fatalError("Did not find cell") }
        cell.questionIV.image = indexPath.row%2 == 0 ? UIImage(named: "oddQuestion") : UIImage(named: "evenQuestion")
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.addLabelAndBackground(number: indexPath.row)
        
        if selectedOption == .test {
            cell.addBestResultLabel(for: indexPath.row, result: UserDefaults.standard.integer(forKey: "correctAnswers\(selectedSport.rawValue)\(selectedTopic.rawValue)\(indexPath.row)"))
        } else {
            cell.addTitleLabel(selectedSport: selectedSport, selectedTopic: selectedTopic, numberOfRow: indexPath.row)
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectedOption {
        case .test:
            let testVC = TestViewController(numberOfRow: indexPath.row)
            testVC.selectedSport = selectedSport
            testVC.selectedTopic = selectedTopic
            navigationController?.pushViewController(testVC, animated: true)
        case .study:
            let studyVC = StudyViewController()
            studyVC.numberOfRow = indexPath.row
            studyVC.selectedSport = selectedSport
            studyVC.selectedTopic = selectedTopic
            navigationController?.pushViewController(studyVC, animated: true)
        }
    }
    
}

enum StudyTestEnum: String {
    case study
    case test
}
