import UIKit

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    
    let nameTextField = CustomTextField()
    let ageTextField = CustomTextField()
    
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    
    var label1 = UILabel()
    var label2 = UILabel()
    var label3 = UILabel()
    
    var maleButton = CustomButton(a: CGPoint(x: 8, y: 3), b: CGPoint(x: 105, y: 0), c: CGPoint(x: 110, y: 45), d: CGPoint(x: 0, y: 45))
    var femaleButton = CustomButton(a: CGPoint(x: 0, y: 5), b: CGPoint(x: 110, y: 0), c: CGPoint(x: 105, y: 50), d: CGPoint(x: 5, y: 50))
    var otherButton = CustomButton(a: CGPoint(x: 0, y: 0), b: CGPoint(x: 100, y: 0), c: CGPoint(x: 108, y: 50), d: CGPoint(x: 5, y: 50))
    lazy var genderArray = [maleButton, femaleButton, otherButton]
    var selectedGenderIndex = 0
    lazy var tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScrollView()
        configurePageControl()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField.setNeedsLayout()
        nameTextField.layoutIfNeeded()
        nameTextField.createBottomLine()

        ageTextField.setNeedsLayout()
        ageTextField.layoutIfNeeded()
        ageTextField.createBottomLine()
    }
 
    @objc func nextButtonAction(sender: UIButton) {
        if pageControl.currentPage == 2{
            if let nameText = nameTextField.text, let ageText = ageTextField.text {
                guard !nameText.isEmpty && !ageText.isEmpty else { return }
                view.removeGestureRecognizer(tap)
                UserDefaults.standard.setValue(nameText, forKey: "name")
                UserDefaults.standard.setValue(ageText, forKey: "age")
                UserDefaults.standard.set(selectedGenderIndex, forKey: "gender")
            } else {
                return
            }
            let startVC = StartViewController()
            self.addChild(startVC)
            self.view.addSubview(startVC.view)
            startVC.didMove(toParent: self)
            nameTextField.text = ""
            ageTextField.text = ""
            nameTextField.resignFirstResponder()
            ageTextField.resignFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        } else {
            scrollView.setContentOffset(CGPoint(x: view.bounds.width * CGFloat(pageControl.currentPage + 1), y: 0), animated: true)
        }
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            ageTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.addGestureRecognizer(tap)
    }
    
}
