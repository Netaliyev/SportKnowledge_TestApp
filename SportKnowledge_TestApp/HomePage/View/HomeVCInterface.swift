import UIKit

extension HomeViewController {
    func configureHomeLabel() {
        view.addSubview(homeHeadLabel)
        homeHeadLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeHeadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeHeadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
            ]
        homeHeadLabel.attributedText = NSAttributedString(string: "QUIZ", attributes: strokeTextAttributes)
        homeHeadLabel.font = UIFont.systemFont(ofSize: 80)
        
    }
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/3.5),
            backgroundIV.heightAnchor.constraint(equalToConstant: view.bounds.height/2)
        ])
    }
    
    func configureFootballButton() {
        view.addSubview(footballButton)
        footballButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footballButton.topAnchor.constraint(equalTo: homeHeadLabel.bottomAnchor, constant: -20),
            footballButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            footballButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            footballButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        footballButton.setImage(UIImage(named: "footballButton"), for: .normal)
        footballButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
    }
    
    func configureBasketballButton() {
        view.addSubview(basketballButton)
        basketballButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            basketballButton.topAnchor.constraint(equalTo: footballButton.bottomAnchor, constant: -30),
            basketballButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            basketballButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            basketballButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        basketballButton.setImage(UIImage(named: "basketballButton"), for: .normal)
        basketballButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    
    func configureMixedButton() {
        view.addSubview(mixedButton)
        mixedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mixedButton.topAnchor.constraint(equalTo: basketballButton.bottomAnchor, constant: -30),
            mixedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mixedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mixedButton.heightAnchor.constraint(equalToConstant: view.bounds.height/3.5)
        ])
        
        mixedButton.setImage(UIImage(named: "mixedButton"), for: .normal)
        mixedButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
    }
    
}
