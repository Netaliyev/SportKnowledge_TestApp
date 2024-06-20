import UIKit

extension StudyViewController{
    
    func configureHeadLabel() {
        view.addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5)
        ])
        
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.orange,
            .foregroundColor : UIColor.clear,
            .strokeWidth : -0.3,
        ]
        
        //TODO: change the head label text
        let text = UserDefaults.standard.string(forKey: "questionTitle\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") ?? "Question Title"
        
        headLabel.attributedText = NSAttributedString(string: text, attributes: strokeTextAttributes)
        headLabel.font = UIFont.systemFont(ofSize: 80)
        
    }
    
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height/6),
            backgroundIV.heightAnchor.constraint(equalToConstant: view.bounds.height/1.3)
        ])
    }
    
    func configureBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: view.bounds.height/12),
            backButton.widthAnchor.constraint(equalToConstant: view.bounds.height/12)
        ])
        
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func configureRectangleIV() {
        view.addSubview(rectangleIV)
        rectangleIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rectangleIV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangleIV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectangleIV.widthAnchor.constraint(equalToConstant: view.bounds.width),
            rectangleIV.heightAnchor.constraint(equalToConstant: view.bounds.height/1.5)
        ])
        rectangleIV.isUserInteractionEnabled = true
    }
    
    func configureTextView() {
        rectangleIV.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.bottomAnchor.constraint(equalTo: rectangleIV.bottomAnchor, constant: -65),
            textView.centerXAnchor.constraint(equalTo: rectangleIV.centerXAnchor),
            textView.topAnchor.constraint(equalTo: rectangleIV.topAnchor, constant: 30),
            textView.leadingAnchor.constraint(equalTo: rectangleIV.leadingAnchor, constant: 50)
        ])
        
        let text = UserDefaults.standard.string(forKey: "questionText\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") ?? "Text for \(selectedSport.rawValue) sport, \(selectedTopic.rawValue) topic, \(numberOfRow) number of row"
        
        var title = UserDefaults.standard.string(forKey: "questionTitle\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") ?? "Title for \(selectedSport.rawValue) sport, \(selectedTopic.rawValue) topic, \(numberOfRow) number of row"
        title = title + "\n\n"
        
        let titleAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22),
                          NSAttributedString.Key.foregroundColor : UIColor.white]
        let textAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
                         NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let textString = NSMutableAttributedString(string: text, attributes: textAttrs)
        let titleString = NSMutableAttributedString(string: title, attributes: titleAttrs)
        
        titleString.append(textString)
        
        textView.attributedText = titleString
        textView.backgroundColor = .clear
        textView.showsVerticalScrollIndicator = false
    }
}
