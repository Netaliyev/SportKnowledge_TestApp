import UIKit

class CustomTextField: UITextField {
    
    func createBottomLine() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(bottomLayer)
    }
}
