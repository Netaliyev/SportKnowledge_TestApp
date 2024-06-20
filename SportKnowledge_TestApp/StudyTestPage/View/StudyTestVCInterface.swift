import UIKit

extension StudyTestViewController {
    func configureHeadLabel() {
        view.addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
            ]
        headLabel.attributedText = NSAttributedString(string: selectedTopic.rawValue.uppercased(), attributes: strokeTextAttributes)
        headLabel.font = UIFont.systemFont(ofSize: 80)
    }
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
//            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/6),
            backgroundIV.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: -20),
            backgroundIV.heightAnchor.constraint(equalToConstant: view.bounds.height - 150)
        ])
    }
    
    func configureStudyButton() {
        view.addSubview(studyButton)
        studyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            studyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/5),
            studyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            studyButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        studyButton.setImage(UIImage(named: "studyButton"), for: .normal)
        studyButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    
    func configureTestButton() {
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testButton.topAnchor.constraint(equalTo: studyButton.bottomAnchor, constant: -10),
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            testButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        testButton.setImage(UIImage(named: "testButton"), for: .normal)
        testButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    
    func configureBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: view.bounds.height/12),
            backButton.widthAnchor.constraint(equalToConstant: view.bounds.height/12)
        ])
        
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func configureStatisticLabels() {
        studyButton.addSubview(completedStudyLabel)
        completedStudyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        testButton.addSubview(completedTestLabel)
        completedTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            completedStudyLabel.bottomAnchor.constraint(equalTo: studyButton.bottomAnchor, constant: -70),
            completedStudyLabel.leadingAnchor.constraint(equalTo: studyButton.leadingAnchor, constant: 50),
            
            completedTestLabel.bottomAnchor.constraint(equalTo: testButton.bottomAnchor, constant: -70),
            completedTestLabel.leadingAnchor.constraint(equalTo: testButton.leadingAnchor, constant: 50)
        ])
        
        completedTestLabel.text = "\(completedTestNumber)/12"
        completedStudyLabel.text = "\(completedStudyNumber)/12"
        completedTestLabel.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        completedStudyLabel.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        
        completedTestLabel.textColor = .white
        completedStudyLabel.textColor = .white
    }

}
