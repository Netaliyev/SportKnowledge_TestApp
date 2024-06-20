import UIKit

extension EditProfileViewController {
    
    func configureBackgroundIV() {
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configurePage(page view: UIView) {
        addImageViews(page: view)
        
        label1.text = "TEXT YOUR NAME"
        label2.text = "YOUR AGE"
        label3.text = "YOUR GENDER"
        
        let labels = [label1, label2, label3]
        
        labels.forEach { label in
            label.font = UIFont.boldSystemFont(ofSize: 26)
            label.textAlignment = .center
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "name is...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        ageTextField.attributedPlaceholder = NSAttributedString(
            string: "age is...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        nameTextField.textAlignment = .center
        ageTextField.textAlignment = .center
        
        nameTextField.font = UIFont.systemFont(ofSize: 20)
        ageTextField.font = UIFont.systemFont(ofSize: 20)
        nameTextField.textColor = .white
        ageTextField.textColor = .white
        nameTextField.autocapitalizationType = .words
        ageTextField.keyboardType = .numberPad
        
        nameTextField.delegate = self
        ageTextField.delegate = self
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        imageView1.addSubview(label1)
        imageView2.addSubview(label2)
        imageView3.addSubview(label3)
        imageView1.addSubview(nameTextField)
        imageView2.addSubview(ageTextField)
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: imageView1.topAnchor, constant: 25),
            label1.leadingAnchor.constraint(equalTo: imageView1.leadingAnchor, constant: 20),
            label1.trailingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: -20),
            
            label2.topAnchor.constraint(equalTo: imageView2.topAnchor, constant: 25),
            label2.leadingAnchor.constraint(equalTo: imageView2.leadingAnchor, constant: 20),
            label2.trailingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: -20),
            
            label3.topAnchor.constraint(equalTo: imageView3.topAnchor, constant: 25),
            label3.leadingAnchor.constraint(equalTo: imageView3.leadingAnchor, constant: 20),
            label3.trailingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: -20),
            
            nameTextField.bottomAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: -75),
            nameTextField.centerXAnchor.constraint(equalTo: imageView1.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 150),
            
            ageTextField.bottomAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: -75),
            ageTextField.centerXAnchor.constraint(equalTo: imageView2.centerXAnchor),
            ageTextField.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        addGenderView(at: imageView3)
    }
    
    func addImageViews(page view: UIView) {
        imageView1 = UIImageView(image: .init(named: "rectangle1"))
        imageView2 = UIImageView(image: .init(named: "rectangle2"))
        imageView3 = UIImageView(image: .init(named: "rectangle3"))

        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(imageView3)

        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        imageView1.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        
        
        //constraints for 3 gray rectangles
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView1.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4),
            
            imageView2.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: -25),
            imageView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView2.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4),
            
            imageView3.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: -25),
            imageView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imageView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            imageView3.heightAnchor.constraint(equalToConstant: self.view.bounds.height/5*1.8)
        ])
    }
    
    func addGenderView(at view: UIView) {
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        view.addSubview(otherButton)
        
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        otherButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            maleButton.topAnchor.constraint(equalTo: label3.topAnchor, constant: 45),
            maleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            maleButton.heightAnchor.constraint(equalToConstant: 50),
            maleButton.widthAnchor.constraint(equalToConstant: 110),
            
            femaleButton.topAnchor.constraint(equalTo: label3.topAnchor, constant: 40),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 35),
            femaleButton.heightAnchor.constraint(equalToConstant: 50),
            femaleButton.widthAnchor.constraint(equalToConstant: 110),
            
            otherButton.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 15),
            otherButton.leadingAnchor.constraint(equalTo: maleButton.leadingAnchor),
            otherButton.heightAnchor.constraint(equalToConstant: 50),
            otherButton.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        let label1 = configureGenderLabel(gender: "Male")
        let label2 = configureGenderLabel(gender: "Female")
        let label3 = configureGenderLabel(gender: "Other")
        
        maleButton.addSubview(label1)
        femaleButton.addSubview(label2)
        otherButton.addSubview(label3)
        
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: maleButton.topAnchor, constant: 8),
            label1.leadingAnchor.constraint(equalTo: maleButton.leadingAnchor, constant: 25),
            
            label2.topAnchor.constraint(equalTo: femaleButton.topAnchor, constant: 9),
            label2.leadingAnchor.constraint(equalTo: femaleButton.leadingAnchor, constant: 18),
            
            label3.topAnchor.constraint(equalTo: otherButton.topAnchor, constant: 8),
            label3.leadingAnchor.constraint(equalTo: otherButton.leadingAnchor, constant: 25),
        ])
        
        maleButton.updateFillColor()
        maleButton.addTarget(self, action: #selector(genderAction(sender:)), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(genderAction(sender:)), for: .touchUpInside)
        otherButton.addTarget(self, action: #selector(genderAction(sender:)), for: .touchUpInside)

    }
    
    func configureGenderLabel(gender: String) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.text = gender
        
        return label
    }
    
    func configureApplyButton() {
        view.addSubview(applyButton)
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            applyButton.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: 5),
            applyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyButton.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            applyButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        applyButton.setImage(UIImage(named: "applyButton"), for: .normal)
        applyButton.addTarget(self, action: #selector(applyAction), for: .touchUpInside)
    }
    
}
