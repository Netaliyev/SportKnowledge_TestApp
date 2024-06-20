import UIKit

class CustomButton: UIButton {
    
    var path: UIBezierPath!
    var a: CGPoint!
    var b: CGPoint!
    var c: CGPoint!
    var d: CGPoint!
    let orangeColor = UIColor(red: 201/255, green: 131/255, blue: 14/255, alpha: 1)
    let grayColor = UIColor.init(red: 44/255, green: 45/255, blue: 46/255, alpha: 1.0)
    var color = UIColor.init(red: 44/255, green: 45/255, blue: 46/255, alpha: 1.0)

    init(a: CGPoint, b: CGPoint, c: CGPoint, d: CGPoint) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        super.init(frame: .zero)
        self.isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatingRectangle() {
        path = UIBezierPath()
        path.move(to: a)
        path.addLine(to: b)
        path.addLine(to: c)
        path.addLine(to: d)
        path.close()
    }
    
    override func draw(_ rect: CGRect) {
        self.creatingRectangle()
        
        color.setFill()
        path.fill()
        
        UIColor.clear.setStroke()
        path.stroke()
    }
    
    func updateFillColor() {
        color = color == grayColor ? orangeColor : grayColor
        setNeedsDisplay()
    }
    
}
