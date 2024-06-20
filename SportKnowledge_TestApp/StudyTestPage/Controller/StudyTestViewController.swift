import UIKit

class StudyTestViewController: UIViewController {
    
    var selectedTopic: topicEnum = .clubs
    var selectedSport: sportEnum = .football
    let headLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "studyTestBackground"))
    
    let studyButton = UIButton()
    let testButton = UIButton()
    let backButton = UIButton()
    
    let completedStudyLabel = UILabel()
    let completedTestLabel = UILabel()
    var completedStudyNumber: Int {
        var result = 0
        for i in 0..<12 {
            if UserDefaults.standard.bool(forKey: "isStudyCompleted\(selectedSport.rawValue)\(selectedTopic.rawValue)\(i)") { result += 1 }
        }
        return result
    }
    
    var completedTestNumber: Int {
        var result = 0
        for i in 0..<12 {
            if UserDefaults.standard.bool(forKey: "isTestCompleted\(selectedSport.rawValue)\(selectedTopic.rawValue)\(i)") { result += 1 }
        }
        return result
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureStatisticLabels()
    }
    
    func configureUI() {
        configureHeadLabel()
        configureBackgroundIV()
        configureStudyButton()
        configureTestButton()
        configureBackButton()
        configureStatisticLabels()
    }
    
    //MARK: Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func buttonAction(sender: UIButton) {
        let questionListVC = QuestionListViewController()
        if sender == studyButton {
            questionListVC.selectedOption = .study
        } else {
            questionListVC.selectedOption = .test
        }
        questionListVC.selectedSport = selectedSport
        questionListVC.selectedTopic = selectedTopic
        navigationController?.pushViewController(questionListVC, animated: true)
    }
}

enum topicEnum: String, CaseIterable {
    case players
    case clubs
    case rules
}
