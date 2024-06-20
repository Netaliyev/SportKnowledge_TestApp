import UIKit

extension TestViewController {
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
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/2),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/10)
        ])
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
    
    func configureQuestionRectangle() {
        view.addSubview(questionRectangle)
        questionRectangle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionRectangle.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 5),
            questionRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionRectangle.widthAnchor.constraint(equalToConstant: view.bounds.width/1.3),
            questionRectangle.heightAnchor.constraint(equalToConstant: view.bounds.height/4.5)
        ])
    }
    
    func configureQuestionTitleLabel() {
        questionRectangle.addSubview(questionTitleLabel)
        questionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionTitleLabel.topAnchor.constraint(equalTo: questionRectangle.topAnchor, constant: 20),
            questionTitleLabel.leadingAnchor.constraint(equalTo: questionRectangle.leadingAnchor, constant: 20)
        ])
        
        questionTitleLabel.text = "Question"
        questionTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        questionTitleLabel.textColor = .white
    }
    
    func configureQuestionTextLabel() {
        questionRectangle.addSubview(questionTextLabel)
        questionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionTextLabel.topAnchor.constraint(equalTo: questionTitleLabel.bottomAnchor, constant: 10),
            questionTextLabel.centerXAnchor.constraint(equalTo: questionRectangle.centerXAnchor),
            questionTextLabel.leadingAnchor.constraint(equalTo: questionTitleLabel.leadingAnchor)
        ])
        
        questionTextLabel.text = UserDefaults.standard.string(forKey: "question\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)\(numberOfQuestion)") ?? "question for \(selectedSport.rawValue) in \(selectedTopic.rawValue) topic, \(numberOfRow) number of row \(numberOfQuestion) question"
        questionTextLabel.font = UIFont.systemFont(ofSize: 16)
        questionTextLabel.textColor = .white
        questionTextLabel.numberOfLines = 0
    }
    
    func configureAnswerRectangles() {
        answerRectanglesArray.forEach { answerRect in
            view.addSubview(answerRect)
            answerRect.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for i in 0..<4 {
            NSLayoutConstraint.activate([
                answerRectanglesArray[i].centerXAnchor.constraint(equalTo: view.centerXAnchor),
                answerRectanglesArray[i].widthAnchor.constraint(equalToConstant: view.bounds.width/1.1),
                answerRectanglesArray[i].heightAnchor.constraint(equalToConstant: view.bounds.height/9)
            ])
            
            if i == 0 {
                answerRectanglesArray[i].topAnchor.constraint(equalTo: questionRectangle.bottomAnchor, constant: 15).isActive = true
            } else {
                answerRectanglesArray[i].topAnchor.constraint(equalTo: answerRectanglesArray[i-1].bottomAnchor, constant: 5).isActive = true
            }
            answerRectanglesArray[i].setImage(UIImage(named: "answerRectangle\(i+1)"), for: .normal)
            
            answerRectanglesArray[i].addSubview(answerLabelsArray[i])
            answerLabelsArray[i].translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                answerLabelsArray[i].leadingAnchor.constraint(equalTo: answerRectanglesArray[i].leadingAnchor, constant: 40),
                answerLabelsArray[i].centerYAnchor.constraint(equalTo: answerRectanglesArray[i].centerYAnchor, constant: -10)
            ])
            
            answerLabelsArray[i].text = UserDefaults.standard.string(forKey: "answer\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)\(numberOfQuestion)\(i)") ?? "answer for \(selectedSport.rawValue) in \(selectedTopic.rawValue) topic, \(numberOfRow) number of row \(numberOfQuestion) answer \(i) option"
            answerLabelsArray[i].textColor = .white
            answerLabelsArray[i].font = UIFont.systemFont(ofSize: 20)
            
            answerRectanglesArray[i].addTarget(self, action: #selector(answerAction(sender:)), for: .touchUpInside)
        }
        
        if let answers = UserDefaults.standard.array(forKey: "rightAnswers\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") as? [Int] {
            rightAnswers = answers
        } else {
            rightAnswers = [0,0,0,0,0,0]
        }
    }
    
    func changeLabels() {
        questionTextLabel.text = UserDefaults.standard.string(forKey: "question\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)\(numberOfQuestion)") ?? "question for \(selectedSport.rawValue) in \(selectedTopic.rawValue) topic, \(numberOfRow) number of row \(numberOfQuestion) question"
        numberOfQuestionLabel.text = "\(numberOfQuestion+1)/6"
        for i in 0..<4 {
            answerLabelsArray[i].text = UserDefaults.standard.string(forKey: "answer\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)\(numberOfQuestion)\(i)") ?? "answer for \(selectedSport.rawValue) in \(selectedTopic.rawValue) topic, \(numberOfRow) number of row \(numberOfQuestion) answer \(i) option"
        }
    }
    
    func configureNumberOfQuestionsLabel() {
        view.addSubview(numberOfQuestionLabel)
        numberOfQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberOfQuestionLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            numberOfQuestionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        numberOfQuestionLabel.text = "1/6"
        numberOfQuestionLabel.font = UIFont.systemFont(ofSize: 25)
        numberOfQuestionLabel.textColor = .lightGray
    }
    
    func configureTimerEclipse() {
        view.addSubview(timerShape)
        timerShape.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerShape.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            timerShape.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerShape.heightAnchor.constraint(equalToConstant: view.bounds.width/6),
            timerShape.widthAnchor.constraint(equalToConstant: view.bounds.width/6),
        ])
    }
    
    func configureTimerLabel() {
        timerShape.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: timerShape.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: timerShape.centerYAnchor)
        ])
        
        timerLabel.text = String(timerDuration)
        timerLabel.textColor = .white
        timerLabel.font = UIFont.systemFont(ofSize: 20)
    }

}
