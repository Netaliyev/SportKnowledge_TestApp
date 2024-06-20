import UIKit



class HomeViewController: UIViewController {
    
    let homeHeadLabel = UILabel()
    let backgroundIV = UIImageView(image: UIImage(named: "homePageBackground"))
    
    let footballButton = UIButton()
    let basketballButton = UIButton()
    let mixedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
        configureUI()
    }
    
    func configureUI() {
        configureHomeLabel()
        configureBackgroundIV()
        configureFootballButton()
        configureBasketballButton()
        configureMixedButton()
    }

    @objc func buttonAction(sender: UIButton) {
        let topicVC = TopicViewController()
        if sender == footballButton {
            topicVC.selectedSport = .football
        } else if sender == basketballButton {
            topicVC.selectedSport = .basketball
        } else {
            topicVC.selectedSport = .mixed
        }
        navigationController?.pushViewController(topicVC, animated: true)
    }
}
