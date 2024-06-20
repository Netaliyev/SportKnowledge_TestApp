//
//  QuestionListTableViewCell.swift
//  SportKnowledge_TestApp
//
//  Created by Nadir Netaliyev on 15.02.2024.
//

import UIKit

class QuestionListTableViewCell: UITableViewCell {
    
    let questionIV = UIImageView(image: UIImage(named: "evenQuestion"))
    let backLabel1 = UILabel()
    let backLabel2 = UILabel()
    let numberLabel = UILabel()
    let resultLabel = UILabel()
    let titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableViewCell() {
        contentView.addSubview(questionIV)
        questionIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            questionIV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            questionIV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            questionIV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        questionIV.contentMode = .scaleAspectFit
    }
    
    func addLabelAndBackground(number: Int) {
        questionIV.addSubview(backLabel1)
        questionIV.addSubview(backLabel2)
        questionIV.addSubview(numberLabel)
        backLabel1.translatesAutoresizingMaskIntoConstraints = false
        backLabel2.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        let topConstant1: CGFloat = number%2 == 0 ? 10 : 5
        let topConstant2: CGFloat = number%2 == 0 ? 5 : 10
        
        NSLayoutConstraint.activate([
            backLabel1.trailingAnchor.constraint(equalTo: questionIV.trailingAnchor, constant: -240),
            backLabel1.topAnchor.constraint(equalTo: questionIV.topAnchor, constant: topConstant1),
            backLabel1.heightAnchor.constraint(equalToConstant: 90 - topConstant1),
            
            backLabel2.topAnchor.constraint(equalTo: questionIV.topAnchor, constant: topConstant2),
            backLabel2.leadingAnchor.constraint(equalTo: backLabel1.trailingAnchor, constant: 100),
            backLabel2.heightAnchor.constraint(equalToConstant: 90 - topConstant2),
            backLabel2.widthAnchor.constraint(equalToConstant: 120),
            
            numberLabel.trailingAnchor.constraint(equalTo: questionIV.trailingAnchor, constant: -20),
            numberLabel.bottomAnchor.constraint(equalTo: questionIV.bottomAnchor, constant: -30)
        ])
        
        backLabel1.font = UIFont.boldSystemFont(ofSize: 120)
        backLabel2.font = UIFont.boldSystemFont(ofSize: 200)
        numberLabel.font = UIFont.boldSystemFont(ofSize: 30)
        backLabel1.textColor = .lightGray
        backLabel2.textColor = .lightGray
        backLabel1.alpha = 0.1
        backLabel2.alpha = 0.1
        numberLabel.textColor = .white
        backLabel1.text = String(number+1)
        backLabel2.text = String(number+1)
        numberLabel.text = String(number+1)
        
    }
    
    func addBestResultLabel(for question: Int, result: Int) {
        questionIV.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: questionIV.bottomAnchor, constant: -20),
            resultLabel.leadingAnchor.constraint(equalTo: questionIV.leadingAnchor, constant: 30)
        ])
        
        
        let text = "\(result)/6"
        let attrs: [NSAttributedString.Key : Any] = [.strokeWidth : -0.1,
                                                     .foregroundColor : UIColor.white,
                                                     .font : UIFont.systemFont(ofSize: 20)]
        
        resultLabel.attributedText = NSAttributedString(string: text, attributes: attrs)
    }
    
    func addTitleLabel(selectedSport: sportEnum, selectedTopic: topicEnum, numberOfRow: Int) {
        questionIV.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: questionIV.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: questionIV.leadingAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: questionIV.centerXAnchor)
        ])
        
        if let title = UserDefaults.standard.string(forKey: "questionTitle\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)") {
            print("NUMBER OF ROW: \(numberOfRow)")
            titleLabel.text = title
        } else {
            titleLabel.text = "Question Title for \(numberOfRow)"
        }
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
}
