import UIKit

class TestResultViewController: UIViewController {
    
    var selectedSport: sportEnum = .football
    var selectedTopic: topicEnum = .clubs
    
    let headLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "statisticBackground"))
    var result = [Bool]()
    var finishedIV = UIImageView(image: UIImage(named: "finishedRectangle"))
    var resultIV = UIImageView(image: UIImage(named: "resultRectangle"))
    let finishedQuizLabel = UILabel()
    let statisticLabel = UILabel()
    let restartButton = UIButton()
    let nextButton = UIButton()
    var numberOfRow = 0
    let questionLabel = UILabel()
    let sectionProgress = UIProgressView()
    let progressLabel = UILabel()
    let starsIVArray: [UIImageView] = {
        var result = [UIImageView]()
        for i in 0..<5 {
            let starIV = UIImageView(image: UIImage(named: "grayStar"))
            result.append(starIV)
        }
        return result
    }()
    var sectionProgressPercent: Float = 0
    let notificationIV = UIImageView(image: UIImage(named: "notification"))
    var timer: Timer!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: sectionProgress.frame.height, width: sectionProgress.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.white.cgColor
        sectionProgress.layer.addSublayer(bottomLayer)
        
        sectionProgress.setNeedsLayout()
        sectionProgress.layoutIfNeeded()
        let gradientImage = UIImage.gradientImage(with: sectionProgress.frame, colors: [UIColor(red: 195/255, green: 118/255, blue: 1/255, alpha: 1).cgColor, UIColor(red: 242/255, green: 182/255, blue: 64/255, alpha: 1).cgColor], locations: nil)
        sectionProgress.progressImage = gradientImage
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        countSectionProgress()
        countQuestionStatistic()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI()
        
    }
    
    func showNotification() {
        view.addSubview(notificationIV)
        notificationIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notificationIV.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            notificationIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationIV.widthAnchor.constraint(equalToConstant: view.frame.width/1.5),
            notificationIV.heightAnchor.constraint(equalToConstant: view.frame.height/10)
        ])
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideNotification), userInfo: nil, repeats: false)
        
    }
    
    @objc func hideNotification() {
        notificationIV.removeFromSuperview()
    }
    
    func countQuestionStatistic() {
        var correctAnswers = 0
        var wrongAnswers = 0
        result.forEach { ans in
            if ans {
                correctAnswers += 1
            } else {
                wrongAnswers += 1
            }
        }
        if UserDefaults.standard.integer(forKey: "correctStat\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") < correctAnswers {
            UserDefaults.standard.set(correctAnswers, forKey: "correctStat\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)")
            UserDefaults.standard.set(wrongAnswers, forKey: "wrongStat\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)")
        }
        
        //MARK: Checking if quiz is completed successfully
        if correctAnswers == 6 {
            UserDefaults.standard.set(true, forKey: "isTestCompleted\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)")
        }
    }
    
    func configureUI() {
        configureHeadLabel()
        configureBackgroundIV()
        configureFinishedIV()
        configureResultIV()
        configureFinishedLabel()
        configureStatisticLabel()
        configureRestartButton()
        configureNextButton()
        configureResultBars()
        configureQuestionLabel()
        configureSectionProgress()
        configureProgressLabel()
        configureStarsIV()
        view.bringSubviewToFront(notificationIV)
        
    }
    
    func countSectionProgress() {
        var correctAnswerCount = 0
        var sum = 0
        result.forEach { res in
            if res == true {
                correctAnswerCount += 1
            }
        }
        if correctAnswerCount > UserDefaults.standard.integer(forKey: "correctAnswers\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)"){
            UserDefaults.standard.set(correctAnswerCount, forKey: "correctAnswers\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)")
        }
        for i in 0..<12 {
            sum += UserDefaults.standard.integer(forKey: "correctAnswers\(selectedSport.rawValue)\(selectedTopic.rawValue)\(i)")
        }
        sectionProgressPercent = Float(sum)/72
        if sectionProgressPercent == 1 {
            achievementOpened()
        }
    }
    
    func achievementOpened() {
        if !UserDefaults.standard.bool(forKey: "achievement\(selectedSport.rawValue)\(selectedTopic.rawValue)") {
            showNotification()
            UserDefaults.standard.set(true, forKey: "achievement\(selectedSport.rawValue)\(selectedTopic.rawValue)")
        }
        
    }
    
    //MARK: Button actions:
    @objc func restartAction() {
        navigationController?.popViewController(animated: false)
    }
    
    @objc func nextAction() {
        if let testVC = navigationController?.viewControllers[navigationController!.viewControllers.count-2] as? TestViewController {
            testVC.numberOfRow = self.numberOfRow + 1
            if numberOfRow == 11 {
                if let questionVC = navigationController?.viewControllers[navigationController!.viewControllers.count-3] as? QuestionListViewController {
                    navigationController?.popToViewController(questionVC, animated: true)
                }
            }else{
                navigationController?.popToViewController(testVC, animated: false)
            }
            
        }
        
    }
    
}

fileprivate extension UIImage {
    static func gradientImage(with bounds: CGRect,
                              colors: [CGColor],
                              locations: [NSNumber]?) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0,
                                           y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                         y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
