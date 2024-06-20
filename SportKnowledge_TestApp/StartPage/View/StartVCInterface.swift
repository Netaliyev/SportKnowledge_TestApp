import UIKit

extension StartViewController {
    func configureEclipseBackground() {
        view.addSubview(eclipse1)
        view.addSubview(eclipse2)
        view.addSubview(eclipse3)
        view.addSubview(eclipse4)
        eclipse1.translatesAutoresizingMaskIntoConstraints = false
        eclipse2.translatesAutoresizingMaskIntoConstraints = false
        eclipse3.translatesAutoresizingMaskIntoConstraints = false
        eclipse4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eclipse1.bottomAnchor.constraint(equalTo: polygonImageView.bottomAnchor, constant: -30),
            eclipse1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            eclipse1.widthAnchor.constraint(equalToConstant: 80),
            eclipse1.heightAnchor.constraint(equalToConstant: 80),
            
            eclipse2.topAnchor.constraint(equalTo: polygonImageView.topAnchor, constant: 40),
            eclipse2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            eclipse2.widthAnchor.constraint(equalToConstant: 45),
            eclipse2.heightAnchor.constraint(equalToConstant: 45),
            
            eclipse3.topAnchor.constraint(equalTo: eclipse2.bottomAnchor, constant: -30),
            eclipse3.leadingAnchor.constraint(equalTo: eclipse2.trailingAnchor, constant: -15),
            eclipse3.widthAnchor.constraint(equalToConstant: 45),
            eclipse3.heightAnchor.constraint(equalToConstant: 45),
            
            eclipse4.bottomAnchor.constraint(equalTo: eclipse1.topAnchor, constant: 15),
            eclipse4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            eclipse4.widthAnchor.constraint(equalToConstant: 45),
            eclipse4.heightAnchor.constraint(equalToConstant: 45)
            
            
        ])
    }
    
    func configureVectorBackground() {
        view.addSubview(vectorImageView)
        vectorImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vectorImageView.topAnchor.constraint(equalTo: view.topAnchor),
            vectorImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vectorImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vectorImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func configurePolygonIV() {
        view.addSubview(polygonImageView)
        polygonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            polygonImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/10),
            polygonImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            polygonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polygonImageView.widthAnchor.constraint(equalToConstant: view.bounds.width/1.1),
//            polygonImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    func configureReadyLabel() {
        polygonImageView.addSubview(readyLabel)
        readyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            readyLabel.topAnchor.constraint(equalTo: polygonImageView.topAnchor, constant: 100),
            readyLabel.leadingAnchor.constraint(equalTo: polygonImageView.leadingAnchor, constant: 35)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -2.0,
            ]

        readyLabel.attributedText = NSAttributedString(string: "READY TO BE PRO?", attributes: strokeTextAttributes)
        readyLabel.font = UIFont.systemFont(ofSize: 30)
        readyLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 6.5)
    }
    
    func configureDescriptionLabel() {
        polygonImageView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: readyLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: readyLabel.leadingAnchor, constant: 35),
            descriptionLabel.trailingAnchor.constraint(equalTo: polygonImageView.trailingAnchor, constant: -50)
        ])

        descriptionLabel.text = "PLAYER NAMES, RULES, TACTICS, DIFFICULTY LEVELS"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 6.5)
    }
    
    func configureCupIV() {
        
        polygonImageView.addSubview(cupImageView)
        cupImageView.translatesAutoresizingMaskIntoConstraints = false
        cupImageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            cupImageView.leadingAnchor.constraint(equalTo: polygonImageView.leadingAnchor, constant: 50),
            cupImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            cupImageView.trailingAnchor.constraint(equalTo: polygonImageView.trailingAnchor, constant: -30),
            cupImageView.bottomAnchor.constraint(equalTo: polygonImageView.bottomAnchor, constant: -100)
        ])
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setImage(UIImage(named: "startButton"), for: .normal)
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: polygonImageView.bottomAnchor),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
    }
    
}
