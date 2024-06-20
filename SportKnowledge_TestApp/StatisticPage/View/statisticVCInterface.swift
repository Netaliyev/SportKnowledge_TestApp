import UIKit

extension StatisticViewController {
    
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
    
    func configureStatLabel() {
        view.addSubview(statisticHeadLabel)
        statisticHeadLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statisticHeadLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            statisticHeadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
        ]
        statisticHeadLabel.attributedText = NSAttributedString(string: "STATISTICS", attributes: strokeTextAttributes)
        statisticHeadLabel.font = UIFont.systemFont(ofSize: 80)
        //        statLabel.alpha = 0.5
        
    }
    
    func configureBackgroundIV1() {
        view.addSubview(backgroundIV1)
        backgroundIV1.translatesAutoresizingMaskIntoConstraints = false
        backgroundIV1.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            backgroundIV1.topAnchor.constraint(equalTo: statisticHeadLabel.bottomAnchor, constant: 0),
            backgroundIV1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundIV1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundIV1.heightAnchor.constraint(equalToConstant: view.bounds.height/3)
        ])
    }
    
    func configureBackgroundIV2() {
        view.addSubview(backgroundIV2)
        backgroundIV2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV2.topAnchor.constraint(equalTo: backgroundIV1.bottomAnchor, constant: -20),
            backgroundIV2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backgroundIV2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            backgroundIV2.heightAnchor.constraint(equalToConstant: view.bounds.height/2.2)
        ])
    }
    
    func configureScrollView() {
        backgroundIV1.addSubview(scrollView)
        //        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: backgroundIV1.leadingAnchor, constant: 30),
            scrollView.topAnchor.constraint(equalTo: backgroundIV1.topAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: backgroundIV1.trailingAnchor, constant: -30),
            scrollView.bottomAnchor.constraint(equalTo: backgroundIV1.bottomAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: (view.bounds.height/8.44+30)*6, height: 150)
        
    }
    
    func configureCups() {
        
        var previousCupIV: UIImageView!
        
        for i in 0..<6 {
            let cupIV = cupArray[i]
            scrollView.addSubview(cupIV)
            cupIV.translatesAutoresizingMaskIntoConstraints = false
            
            switch i {
            case 0: if UserDefaults.standard.bool(forKey: "achievementfootballplayers") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            case 1: if UserDefaults.standard.bool(forKey: "achievementfootballclubs") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            case 2:  if UserDefaults.standard.bool(forKey: "achievementfootballrules") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            case 3:  if UserDefaults.standard.bool(forKey: "achievementbasketballplayers") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            case 4: if UserDefaults.standard.bool(forKey: "achievementbasketballclubs") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            case 5:  if UserDefaults.standard.bool(forKey: "achievementbasketballrules") {
                cupIV.image = UIImage(named: "achievedCup")
            }
            default : break
            }
            
            NSLayoutConstraint.activate([
                cupIV.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
                cupIV.widthAnchor.constraint(equalToConstant: view.bounds.height/8.44),
                cupIV.heightAnchor.constraint(equalToConstant: view.bounds.height/8.44)
            ])
            
            if let previousCup = previousCupIV {
                cupIV.leadingAnchor.constraint(equalTo: previousCup.trailingAnchor, constant: 25).isActive = true
            } else {
                cupIV.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25).isActive = true
            }
            previousCupIV = cupIV
            
            let label = UILabel()
            scrollView.addSubview(label)
            label.text = achievementNames[i]
            label.numberOfLines = 3
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontSizeToFitWidth = true
            label.textColor = .white
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: cupIV.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: cupIV.trailingAnchor),
                label.bottomAnchor.constraint(equalTo: backgroundIV1.bottomAnchor, constant: -70),
                cupIV.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -5)
            ])
        }
    }
    
    func configureSecondRectangleLabels() {
        let view = backgroundIV2
        view.addSubview(statisticLabel)
        statisticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(numberOfQuestionsLabel)
        numberOfQuestionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let height = self.view.bounds.height
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: height/30),
            statisticLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            numberOfQuestionsLabel.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 10),
            numberOfQuestionsLabel.leadingAnchor.constraint(equalTo: statisticLabel.leadingAnchor),
            numberOfQuestionsLabel.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        //Statistic label configuration
        statisticLabel.text = "STATISTIC"
        statisticLabel.font = UIFont.boldSystemFont(ofSize: 23)
        statisticLabel.textColor = .white
        
        //Number of Question label configuration
        let text = "NUMBER OF COMPLETED QUESTIONS: "
        let number = String(UserDefaults.standard.integer(forKey: "completedQuestions"))
        let textAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: height/60)]
        let numberAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: height/56)]
        let boldedString = NSMutableAttributedString(string:number, attributes:numberAttrs)
        let resultText = NSMutableAttributedString(string: text, attributes: textAttrs)
        resultText.append(boldedString)
        
        numberOfQuestionsLabel.attributedText = resultText
        numberOfQuestionsLabel.textColor = .white
        numberOfQuestionsLabel.numberOfLines = 2
        
    }
    
    func configurePieChart() {
        backgroundIV2.addSubview(pieChartContainerView)
        pieChartContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let height = view.bounds.height
        NSLayoutConstraint.activate([
            pieChartContainerView.topAnchor.constraint(equalTo: numberOfQuestionsLabel.bottomAnchor, constant: height/50),
            pieChartContainerView.leadingAnchor.constraint(equalTo: numberOfQuestionsLabel.leadingAnchor),
            pieChartContainerView.widthAnchor.constraint(equalToConstant: height/5.275),
            pieChartContainerView.heightAnchor.constraint(equalToConstant: height/5.275)
        ])
        pieChartContainerView.addSubview(pieChartView)
        
        pieChartView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
        pieChartView.segments = [
            Segment(color: UIColor(red: 206/255, green: 33/255, blue: 53/255, alpha: 1.0), value: CGFloat(wrongAnswerCounter)),
            Segment(color: UIColor(red: 43/255, green: 120/255, blue: 38/255, alpha: 1.0), value: CGFloat(correctAnswerCounter))
        ]
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pieChartView.centerXAnchor.constraint(equalTo: pieChartContainerView.centerXAnchor),
            pieChartView.centerYAnchor.constraint(equalTo: pieChartContainerView.centerYAnchor),
            pieChartView.widthAnchor.constraint(equalTo: pieChartContainerView.widthAnchor, multiplier: 0.96),
            pieChartView.heightAnchor.constraint(equalTo: pieChartContainerView.heightAnchor, multiplier: 0.96)
        ])
    }
    
    func configureCircles() {
        backgroundIV2.addSubview(greenCircleIV)
        backgroundIV2.addSubview(redCircleIV)
        
        greenCircleIV.translatesAutoresizingMaskIntoConstraints = false
        redCircleIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greenCircleIV.topAnchor.constraint(equalTo: pieChartView.topAnchor, constant: 10),
            greenCircleIV.leadingAnchor.constraint(equalTo: pieChartView.trailingAnchor, constant: 10),
            greenCircleIV.widthAnchor.constraint(equalToConstant: 10),
            greenCircleIV.heightAnchor.constraint(equalToConstant: 10),
            
            redCircleIV.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: -40),
            redCircleIV.leadingAnchor.constraint(equalTo: pieChartView.trailingAnchor, constant: 10),
            redCircleIV.widthAnchor.constraint(equalToConstant: 10),
            redCircleIV.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func configureAnswerStatisticLabels() {
        backgroundIV2.addSubview(rightAnswerLabel)
        backgroundIV2.addSubview(wrongAnswerLabel)
        
        rightAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rightAnswerLabel.topAnchor.constraint(equalTo: greenCircleIV.topAnchor, constant: -5),
            rightAnswerLabel.leadingAnchor.constraint(equalTo: greenCircleIV.trailingAnchor, constant: 5),
            rightAnswerLabel.widthAnchor.constraint(equalToConstant: 80),
            
            wrongAnswerLabel.topAnchor.constraint(equalTo: redCircleIV.topAnchor, constant: -20),
            wrongAnswerLabel.leadingAnchor.constraint(equalTo: redCircleIV.trailingAnchor, constant: 5),
            wrongAnswerLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        let normalAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light)]
        let boldAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
        let rightText = NSMutableAttributedString(string: "RIGHT ANSWERS\n", attributes: normalAttrs)
        let rightText2 = NSMutableAttributedString(string: "\(correctAnswerCounter)          ", attributes: boldAttrs)
        
        var totalAnswerCounter = correctAnswerCounter + wrongAnswerCounter
        if totalAnswerCounter == 0 { totalAnswerCounter = 1 }
        let rightText3 = NSMutableAttributedString(string: "\(correctAnswerCounter/(totalAnswerCounter)*100)%", attributes: normalAttrs)
        rightText.append(rightText2)
        rightText.append(rightText3)
        
        let wrongText = NSMutableAttributedString(string: "\(wrongAnswerCounter)        ", attributes: boldAttrs)
        let wrongText2 = NSMutableAttributedString(string: "\(wrongAnswerCounter/(totalAnswerCounter)*100)% \nWRONG ANSWERS", attributes: normalAttrs)
        wrongText.append(wrongText2)
        
        rightAnswerLabel.attributedText = rightText
        wrongAnswerLabel.attributedText = wrongText
        rightAnswerLabel.numberOfLines = 3
        wrongAnswerLabel.numberOfLines = 3
        
        rightAnswerLabel.textColor = .white
        wrongAnswerLabel.textColor = .white
    }
}

extension StatisticViewController {
    func applyCircularBlur() {
        // Create a circular mask
        let circularPath = UIBezierPath(ovalIn: pieChartContainerView.bounds)
        let maskLayer = CAShapeLayer()
        maskLayer.path = circularPath.cgPath
        
        // Create a blur effect
        let blurEffect = UIBlurEffect(style: .regular)
        
        // Create a visual effect view with the blur effect
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        // Set the frame of the visual effect view to cover the circular mask
        blurEffectView.frame = pieChartContainerView.bounds
        
        // Add the mask to the visual effect view
        blurEffectView.layer.mask = maskLayer
        
        // Add the visual effect view to the background
        pieChartContainerView.addSubview(blurEffectView)
        
        // Bring the pie chart container view to the front so that it's not blurred
        pieChartContainerView.bringSubviewToFront(pieChartView)
    }
}
