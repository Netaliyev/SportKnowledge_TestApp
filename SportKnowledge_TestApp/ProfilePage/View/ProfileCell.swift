//
//  ProfileCell.swift
//  SportKnowledge_TestApp
//
//  Created by Nadir Netaliyev on 10.02.2024.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .init(red: 57/255, green: 60/255, blue: 61/255, alpha: 1.0)
        contentView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
        
    }
    
    func configureLabel(text: String) {
        label.text = text
        label.textColor = .white
    }
    
}
