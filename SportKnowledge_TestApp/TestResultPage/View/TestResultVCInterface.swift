import UIKit

extension TestResultViewController {
    
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
        headLabel.attributedText = NSAttributedString(string: "TEST", attributes: strokeTextAttributes)
        headLabel.font = UIFont.systemFont(ofSize: 80)
        
    }
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configureFinishedIV() {
        view.addSubview(finishedIV)
        finishedIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finishedIV.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: -20),
            finishedIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishedIV.heightAnchor.constraint(equalToConstant: view.frame.height/4.3),
            finishedIV.widthAnchor.constraint(equalToConstant: view.frame.width/1.15)
        ])
    }
    
    func configureResultIV() {
        view.addSubview(resultIV)
        resultIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultIV.topAnchor.constraint(equalTo: finishedIV.bottomAnchor, constant: 30),
            resultIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultIV.widthAnchor.constraint(equalTo: finishedIV.widthAnchor, multiplier: 1.05),
            resultIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height/8)
        ])
    }
    
    func configureFinishedLabel() {
        view.addSubview(finishedQuizLabel)
        finishedQuizLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            finishedQuizLabel.centerXAnchor.constraint(equalTo: finishedIV.centerXAnchor),
            finishedQuizLabel.topAnchor.constraint(equalTo: finishedIV.topAnchor, constant: 30)
        ])
        
        finishedQuizLabel.text = "YOU FINISHED QUIZ"
        finishedQuizLabel.font = UIFont.boldSystemFont(ofSize: 25)
        finishedQuizLabel.textColor = .white
        
    }
    
    func configureStatisticLabel() {
        view.addSubview(statisticLabel)
        statisticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statisticLabel.centerXAnchor.constraint(equalTo: finishedIV.centerXAnchor),
            statisticLabel.bottomAnchor.constraint(equalTo: finishedIV.bottomAnchor, constant: -30)
        ])
        
        statisticLabel.text = "STATISTIC:"
        statisticLabel.font = UIFont.systemFont(ofSize: 25, weight: .light)
        statisticLabel.textColor = .white
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            restartButton.topAnchor.constraint(equalTo: resultIV.bottomAnchor, constant: 10),
            restartButton.heightAnchor.constraint(equalToConstant: 85),
            restartButton.widthAnchor.constraint(equalToConstant: 180),
            restartButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 10)
        ])
        
        restartButton.setImage(UIImage(named: "restartButton"), for: .normal)
        restartButton.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: restartButton.topAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 80),
            nextButton.widthAnchor.constraint(equalToConstant: 170),
            nextButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -5)
        ])
        
        nextButton.setImage(UIImage(named: "nextButton"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    }
    
    func configureResultBars() {
        var previousLabel: UILabel!
        
        for i in 0..<6 {
            let label = UILabel()
            let view = UIView()
            let greenColor =  UIColor(red: 77/255, green: 181/255, blue: 71/255, alpha: 1)
            let redColor = UIColor(red: 230/255, green: 42/255, blue: 64/255, alpha: 1)
            
            resultIV.addSubview(label)
            resultIV.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: resultIV.topAnchor, constant: 60),
//                label.leadingAnchor.constraint(equalTo: resultIV.leadingAnchor, constant: 50),
                
                view.topAnchor.constraint(equalTo: label.bottomAnchor),
                view.centerXAnchor.constraint(equalTo: label.centerXAnchor),
                view.widthAnchor.constraint(equalTo: label.widthAnchor, multiplier: 2.5),
                view.heightAnchor.constraint(equalToConstant: 3.5)
            ])
            
            if i == 0 {
                label.leadingAnchor.constraint(equalTo: resultIV.leadingAnchor, constant: 50).isActive = true
            } else {
                label.leadingAnchor.constraint(equalTo: previousLabel.trailingAnchor, constant: self.view.frame.width/11.14).isActive = true
            }
            
            label.text = String(i+1)
            label.font = UIFont.systemFont(ofSize: 26)
            label.textColor = .white
            view.backgroundColor = result[i] ? greenColor : redColor
            view.layer.cornerRadius = 3
            
            previousLabel = label
        }
    }
    
    func configureQuestionLabel() {
        resultIV.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: resultIV.topAnchor, constant: 100),
            questionLabel.leadingAnchor.constraint(equalTo: resultIV.leadingAnchor, constant: 43),
        ])
        
        questionLabel.text = "Questions"
        questionLabel.textColor = .white
        
    }
    
    func configureSectionProgress() {
        resultIV.addSubview(sectionProgress)
        sectionProgress.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionProgress.centerYAnchor.constraint(equalTo: resultIV.centerYAnchor, constant: 0),
            sectionProgress.centerXAnchor.constraint(equalTo: resultIV.centerXAnchor),
            sectionProgress.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            sectionProgress.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        sectionProgress.progressTintColor = UIColor(red: 242/255, green: 182/255, blue: 64/255, alpha: 1)
        
        sectionProgress.trackTintColor = .clear
        sectionProgress.progress = sectionProgressPercent
        
    }

    func configureProgressLabel() {
        resultIV.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: sectionProgress.bottomAnchor, constant: 5),
            progressLabel.leadingAnchor.constraint(equalTo: sectionProgress.leadingAnchor)
        ])
        
        progressLabel.text = "Section completed: \(Int(sectionProgress.progress*100))%"
        progressLabel.textColor = .white
    }
    
    func configureStarsIV() {
        var previousStar: UIImageView!
        for star in starsIVArray {
            resultIV.addSubview(star)
            star.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                star.bottomAnchor.constraint(equalTo: resultIV.bottomAnchor, constant: -view.frame.height/17),
                star.heightAnchor.constraint(equalToConstant: 40),
                star.widthAnchor.constraint(equalToConstant: 40)
            ])
            if let prev = previousStar {
                star.leadingAnchor.constraint(equalTo: prev.trailingAnchor, constant: view.frame.width/19.5).isActive = true
            } else {
                star.leadingAnchor.constraint(equalTo: resultIV.leadingAnchor, constant: view.frame.width/9.75).isActive = true
            }
            previousStar = star
        }
        var count = 0
        result.forEach { ans in
            if ans == true {
                count += 1
            }
        }
        count = count*5/6
        for i in 0..<count {
            starsIVArray[i].image = UIImage(named: "goldStar")
        }
    }
}
