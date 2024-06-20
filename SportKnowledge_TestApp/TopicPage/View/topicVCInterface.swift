import UIKit

extension TopicViewController {
    
    func configureTopicLabel() {
        view.addSubview(topicHeadLabel)
        topicHeadLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topicHeadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topicHeadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
            ]
        topicHeadLabel.attributedText = NSAttributedString(string: selectedSport.rawValue.uppercased(), attributes: strokeTextAttributes)
        topicHeadLabel.font = UIFont.systemFont(ofSize: 80)
        
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
    
    func configurePlayersButton() {
        view.addSubview(playersButton)
        playersButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playersButton.topAnchor.constraint(equalTo: topicHeadLabel.bottomAnchor, constant: -15),
            playersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            playersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            playersButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        playersButton.setImage(UIImage(named: "playersButton"), for: .normal)
        playersButton.addTarget(self, action: #selector(topicAction(sender:)), for: .touchUpInside)
    }
    
    func configureClubsButton() {
        view.addSubview(clubsButton)
        clubsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            clubsButton.topAnchor.constraint(equalTo: playersButton.bottomAnchor, constant: -30),
            clubsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            clubsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            clubsButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        clubsButton.setImage(UIImage(named: "clubsButton"), for: .normal)
        clubsButton.addTarget(self, action: #selector(topicAction(sender:)), for: .touchUpInside)
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: clubsButton.bottomAnchor, constant: -30),
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            rulesButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        rulesButton.setImage(UIImage(named: "rulesButton"), for: .normal)
        rulesButton.addTarget(self, action: #selector(topicAction(sender:)), for: .touchUpInside)
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
