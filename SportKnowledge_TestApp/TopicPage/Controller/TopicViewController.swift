import UIKit

class TopicViewController: UIViewController {

    var selectedSport: sportEnum = .football
    let topicHeadLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "topicBackground"))
    
    let playersButton = UIButton()
    let clubsButton = UIButton()
    let rulesButton = UIButton()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
        navigationController?.isNavigationBarHidden = true
        configureUI()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureBackgroundIV()
        configureTopicLabel()
        configurePlayersButton()
        configureClubsButton()
        configureRulesButton()
        configureBackButton()
    }
    
    
    //MARK: Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func topicAction(sender: UIButton) {
        let studyTestVC = StudyTestViewController()
        if sender == clubsButton {
            studyTestVC.selectedTopic = .clubs
        } else if sender == playersButton {
            studyTestVC.selectedTopic = .players
        } else {
            studyTestVC.selectedTopic = .rules
        }
        studyTestVC.selectedSport = selectedSport
        navigationController?.pushViewController(studyTestVC, animated: true)
    }
}

enum sportEnum: String, CaseIterable {
    case football
    case basketball
    case mixed
}
