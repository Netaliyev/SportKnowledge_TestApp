import UIKit

class EditProfileViewController: UIViewController {
    
    var backgroundIV = UIImageView(image: UIImage(named: "Background3"))
    
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()

    let nameTextField = CustomTextField()
    let ageTextField = CustomTextField()
    
    var maleButton = CustomButton(a: CGPoint(x: 8, y: 3), b: CGPoint(x: 105, y: 0), c: CGPoint(x: 110, y: 45), d: CGPoint(x: 0, y: 45))
    var femaleButton = CustomButton(a: CGPoint(x: 0, y: 5), b: CGPoint(x: 110, y: 0), c: CGPoint(x: 105, y: 50), d: CGPoint(x: 5, y: 50))
    var otherButton = CustomButton(a: CGPoint(x: 0, y: 0), b: CGPoint(x: 100, y: 0), c: CGPoint(x: 108, y: 50), d: CGPoint(x: 5, y: 50))
    lazy var genderArray = [maleButton, femaleButton, otherButton]
    var selectedGenderIndex = 0
    lazy var tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    
    let applyButton = UIButton()
    var delegate: EditProfileDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeGradientLayer(for: view)
        view.addGestureRecognizer(tap)

        configureUI()
        nameTextField.text = UserDefaults.standard.string(forKey: "name")
        ageTextField.text = String(UserDefaults.standard.integer(forKey: "age"))
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
    
    func configureUI() {
        configureBackgroundIV()
        configurePage(page: view)
        configureApplyButton()
    }
    
    @objc func genderAction(sender: CustomButton) {
        if genderArray[selectedGenderIndex] == sender {
            return
        } else {
            genderArray[selectedGenderIndex].updateFillColor()
            sender.updateFillColor()
            if let index = genderArray.firstIndex(of: sender) {
                selectedGenderIndex = index
            } else {
                fatalError("Error in gender buttons")
            }
        }
    }
    
    @objc func applyAction() {
        if let nameText = nameTextField.text, let ageText = ageTextField.text {
            guard !nameText.isEmpty && !ageText.isEmpty else { return }
            view.removeGestureRecognizer(tap)
            UserDefaults.standard.setValue(nameText, forKey: "name")
            UserDefaults.standard.setValue(ageText, forKey: "age")
            UserDefaults.standard.set(selectedGenderIndex, forKey: "gender")
        } else {
            return
        }
        delegate?.applyChanges()
        self.dismiss(animated: true)
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            ageTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
