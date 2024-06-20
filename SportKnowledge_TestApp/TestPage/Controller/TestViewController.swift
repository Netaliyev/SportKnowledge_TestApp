import UIKit

class TestViewController: UIViewController {
    
    var selectedSport: sportEnum = .football
    var selectedTopic: topicEnum = .clubs
    
    let backButton = UIButton()
    let headLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "testBackground"))
    let questionRectangle = UIImageView(image: UIImage(named: "questionRectangle"))
    let questionTitleLabel = UILabel()
    let questionTextLabel = UILabel()
    let answerRectanglesArray: [UIButton] = {
        var result = [UIButton]()
        for i in 0..<4 {
            let button = UIButton()
            button.tag = i
            result.append(button)
        }
        return result
    }()
    let answerLabelsArray = {
        var result = [UILabel]()
        for i in 0..<4 {
            let label = UILabel()
            result.append(label)
        }
        return result
    }()
    let numberOfQuestionLabel = UILabel()
    var numberOfRow = 0
    var numberOfQuestion = 0
    var timer = Timer()
    let timerShape = UIImageView(image: UIImage(named: "timerEclipse"))
    var timerDuration = 90
    let timerLabel = UILabel()
    
    let shapeLayer = CAShapeLayer()
    var result = [false, false, false, false, false, false]
    var rightAnswers = [Int]()
    
    init(numberOfRow: Int) {
        super.init(nibName: nil, bundle: nil)
        self.numberOfRow = numberOfRow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animationCircular()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        writeInUserDefaults(for: numberOfRow)
        configureUI()
        startTimer()
        basicAnimation()
    }
    
    func configureUI() {
        configureHeadLabel()
        configureBackgroundIV()
        configureBackButton()
        configureQuestionRectangle()
        configureQuestionTitleLabel()
        configureQuestionTextLabel()
        configureAnswerRectangles()
        configureNumberOfQuestionsLabel()
        configureTimerEclipse()
        configureTimerLabel()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    //MARK: Timer animation
    func animationCircular() {
        
        let center = CGPoint(x: timerShape.frame.width/2, y: timerShape.frame.height/2)
        let endAngle = (-CGFloat.pi/2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center, radius: timerShape.frame.height/2, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = UIColor.white.cgColor
        timerShape.layer.addSublayer(shapeLayer)
    }
    
    func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(timerDuration)
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    //MARK: Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func timerAction() {
        timerDuration -= 1
        timerLabel.text = String(timerDuration)
        if timerDuration == 0 {
            let testResultVC = TestResultViewController()
            testResultVC.result = self.result
            testResultVC.numberOfRow = numberOfRow
            testResultVC.selectedSport = selectedSport
            testResultVC.selectedTopic = selectedTopic
            navigationController?.pushViewController(testResultVC, animated: true)
            numberOfQuestion = 0
            timer.invalidate()
            timerDuration = 90
            result.removeAll()
        }
    }
    
    @objc func answerAction(sender: UIButton) {
        result[numberOfQuestion] = (sender.tag == rightAnswers[numberOfQuestion])
        numberOfQuestion += 1
        if numberOfQuestion == 6 {
            let testResultVC = TestResultViewController()
            testResultVC.result = self.result
            testResultVC.numberOfRow = numberOfRow
            testResultVC.selectedSport = selectedSport
            testResultVC.selectedTopic = selectedTopic
            navigationController?.pushViewController(testResultVC, animated: true)
            numberOfQuestion = 0
            timer.invalidate()
            timerDuration = 90
            result = [false, false, false, false, false, false]
        } else {
            changeLabels()
        }
    }
}


// write in userDefaults
extension TestViewController {
    func writeInUserDefaults(for numberOfRow: Int) {
        switch numberOfRow {
        case 0:
            var numberOfQuestion = 0
            UserDefaults.standard.set("Barcelona", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Real Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Manchester United", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("PSG", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("In which club did Messi spend his entire professional career?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            
            numberOfQuestion += 1
            UserDefaults.standard.set("Milan", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Inter", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Juventus", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Napoli", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("What is the best club in Italy?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Milan", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Real Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Manchester United", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Liverpool", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Who won the most UCL trophees?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Italy", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Germany", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Brazil", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("England", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Which National team won the most World Cups?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Manchester United", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Sporting", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Real Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Porto", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("In what team did Ronaldo start his professional carreer?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("LA Galaxy", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("PSG", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Manchester United", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Milan", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("In what club did Ibrahimovic retire from professional football?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion = 0
            
            UserDefaults.standard.set([0,0,1,2,1,3], forKey: "rightAnswersfootballplayers\(numberOfRow)")
        case 1:
            var numberOfQuestion = 0
            UserDefaults.standard.set("Real Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Manchester City", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Inter", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Bayern Munich", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Who won the 2023 UCL trophy?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            
            numberOfQuestion += 1
            UserDefaults.standard.set("Al Nassr", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Juventus", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Al Hilal", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Miami United", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Where does Ronaldo play right now?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("England", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Germany", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Norway", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Belgium", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Where is De Bruyne from?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Real Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Girona", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Barcelona", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Atletico Madrid", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Who won last La Liga title?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Balloteli", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Bale", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("De Bruyne", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Beckham", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("BBC - _ Benzema Cristiano \nWho is the first one?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion += 1
            UserDefaults.standard.set("Milan", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)0")
            UserDefaults.standard.set("Juventus", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)1")
            UserDefaults.standard.set("Inter", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)2")
            UserDefaults.standard.set("Napoli", forKey: "answerfootballplayers\(numberOfRow)\(numberOfQuestion)3")
            UserDefaults.standard.set("Who won the most Seria A titles?", forKey: "questionfootballplayers\(numberOfRow)\(numberOfQuestion)")
            numberOfQuestion = 0
            
            UserDefaults.standard.set([1,0,3,2,1,1], forKey: "rightAnswersfootballplayers\(numberOfRow)")
        default: break
        }
        
        
    }
}
