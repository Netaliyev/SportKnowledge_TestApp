import UIKit

class CircleView: UIView {

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        context.addEllipse(in: rect)
        context.setFillColor(UIColor.darkGray.cgColor)
        context.fillPath()
    }
}
