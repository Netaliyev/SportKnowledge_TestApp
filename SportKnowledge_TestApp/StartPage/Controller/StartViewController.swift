import UIKit

class StartViewController: UIViewController {
    
    let eclipse1 = UIImageView(image: UIImage(named: "eclipse1"))
    let eclipse2 = UIImageView(image: UIImage(named: "eclipse2"))
    let eclipse3 = UIImageView(image: UIImage(named: "eclipse3"))
    let eclipse4 = UIImageView(image: UIImage(named: "eclipse3"))

    
    let vectorImageView = UIImageView(image: UIImage(named: "startBackground")!)
    let polygonImageView = UIImageView(image: UIImage(named: "startPolygon")!)
    let readyLabel = UILabel()
    let descriptionLabel = UILabel()
    let cupImageView = UIImageView(image: UIImage(named: "cupStartVC"))
    let startButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeGradientLayer(for: self.view)
        configureVectorBackground()
        configurePolygonIV()
        configureReadyLabel()
        configureDescriptionLabel()
        configureCupIV()
        configureStartButton()
        configureEclipseBackground()
    }
    
    @objc func startButtonAction() {
        let tabbarController = UITabBarController()
        
        let homeVC = HomeViewController()
        let statisticVC = StatisticViewController()
        let profileVC = ProfileViewController()
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileNC.view.isUserInteractionEnabled = true
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeNC.view.isUserInteractionEnabled = true
        
        tabbarController.viewControllers = [
            homeNC,
            statisticVC,
            profileNC
        ]
        
        let homeIcon: UIImage = resizeImage(image: UIImage(named: "homeTabbar")!, targetSize: CGSize(width: 70, height: 70))
        let statisticIcon: UIImage = resizeImage(image: UIImage(named: "statisticTabbar")!, targetSize: CGSize(width: 70, height: 70))
        let profileIcon: UIImage = resizeImage(image: UIImage(named: "profileTabbar")!, targetSize: CGSize(width: 70, height: 70))
        
        let selectedHomeIcon = resizeImage(image: UIImage(named: "selectedHomeTabbar")!, targetSize: CGSize(width: 140, height: 140))
        let selectedStatisticIcon = resizeImage(image: UIImage(named: "selectedStatisticTabbar")!, targetSize: CGSize(width: 140, height: 140))
        let selectedProfileIcon = resizeImage(image: UIImage(named: "selectedProfileTabbar")!, targetSize: CGSize(width: 140, height: 140))
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: homeIcon.withRenderingMode(.alwaysOriginal), tag: 0)
        statisticVC.tabBarItem = UITabBarItem(title: nil, image: statisticIcon.withRenderingMode(.alwaysOriginal), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: nil, image: profileIcon.withRenderingMode(.alwaysOriginal), tag: 2)
        
        homeVC.tabBarItem.selectedImage = selectedHomeIcon.withRenderingMode(.alwaysOriginal)
        statisticVC.tabBarItem.selectedImage = selectedStatisticIcon.withRenderingMode(.alwaysOriginal)
        profileVC.tabBarItem.selectedImage = selectedProfileIcon.withRenderingMode(.alwaysOriginal)
        
        self.addChild(tabbarController)
        self.view.addSubview(tabbarController.view)
        tabbarController.didMove(toParent: self)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
       let size = image.size
       
       let widthRatio  = targetSize.width  / size.width
       let heightRatio = targetSize.height / size.height
       
       // Figure out what our orientation is, and use that to form the rectangle
       var newSize: CGSize
       if(widthRatio > heightRatio) {
           newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
       } else {
           newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
       }
       
       // This is the rect that we've calculated out and this is what is actually used below
       let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
       
       // Actually do the resizing to the rect using the ImageContext stuff
       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
       image.draw(in: rect)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       
       return newImage!
   }
}
