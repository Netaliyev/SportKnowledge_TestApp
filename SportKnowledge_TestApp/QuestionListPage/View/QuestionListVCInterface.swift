import UIKit

extension QuestionListViewController {
    
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
        headLabel.attributedText = NSAttributedString(string: selectedOption.rawValue.uppercased(), attributes: strokeTextAttributes)
        headLabel.font = UIFont.systemFont(ofSize: 80)
        
    }
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/6),
            backgroundIV.heightAnchor.constraint(equalToConstant: view.bounds.height/1.3)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        tableView.showsVerticalScrollIndicator = false
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
    
}
