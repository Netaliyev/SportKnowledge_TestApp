import UIKit

extension ViewController {
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        scrollView.isUserInteractionEnabled = true
        scrollView.contentSize = CGSize(width: Int(view.bounds.width)*3, height: Int(view.bounds.height))
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.isScrollEnabled = false
        
        var previousPageView: UIView?
        
        for i in 0..<3 {
            let pageView = UIView()
            pageView.backgroundColor = UIColor.clear
            scrollView.addSubview(pageView)
            pageView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                pageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                pageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                pageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            ])

            if let previousPage = previousPageView {
                pageView.leadingAnchor.constraint(equalTo: previousPage.trailingAnchor).isActive = true
            } else {
                pageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            }
            previousPageView = pageView
            
            makeGradientLayer(for: pageView)
            configureBackgroundIV(at: i, of: pageView)
            if i < 2 {
                configureBackgroundPlayerIV(at: i, of: pageView)
                configureTopTextView(at: i, of: pageView)
                configureBottomTextView(at: i, of: pageView)
            } else {
                configureThirdPage(page: pageView)
            }
            configureNextButton(at: i, of: pageView)
        }
    }
    
     func makeGradientLayer(for view: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.frame = self.view.bounds
        view.layer.addSublayer(gradient)
    }
    
    func configureBackgroundIV(at page: Int, of view: UIView) {
        let backgroundIV = UIImageView()
        backgroundIV.image = UIImage(named: "Background\(page+1)")
        view.addSubview(backgroundIV)
        backgroundIV.translatesAutoresizingMaskIntoConstraints = false
        var bottomConstant: CGFloat = -100
        if page == 2 { bottomConstant = -200 }
        
        NSLayoutConstraint.activate([
            backgroundIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundIV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundIV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant),
            backgroundIV.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func configureBackgroundPlayerIV(at page: Int, of view: UIView) {
        let backgroundPlayerIV = UIImageView()
        backgroundPlayerIV.image = UIImage(named: "playerLayer\(page+1)")
        view.addSubview(backgroundPlayerIV)
        backgroundPlayerIV.translatesAutoresizingMaskIntoConstraints = false
        backgroundPlayerIV.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            backgroundPlayerIV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundPlayerIV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundPlayerIV.heightAnchor.constraint(equalToConstant: 440),
            backgroundPlayerIV.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func configureTopTextView(at page: Int, of view: UIView) {
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        topView.layer.cornerRadius = 15
        topView.addBlurEffect()
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            topView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        configureTopLabel(at: page, of: topView)
        
    }
    
    func configureTopLabel(at page: Int, of topView: UIView) {
        let topLabel = UILabel()
        topView.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        switch page{
        case 0: topLabel.text = "LEARN FOOTBALL LIKE A REAL PRO!"
        case 1: topLabel.text = "ALL BASKETBALL INFORMATION IN OUR APP!"
        default: break
        }
        
        topLabel.font = UIFont.boldSystemFont(ofSize: 25)
        topLabel.textColor = .white
        topLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            topLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            topLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureBottomTextView(at page: Int, of view: UIView) {
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        bottomView.layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -145),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100)
        ])
        configureBottomLabel(at: page, of: bottomView)
    }
    
    func configureBottomLabel(at page: Int, of bottomView: UIView) {
        let bottomLabel = UILabel()
        bottomView.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        switch page{
        case 0: bottomLabel.text = "Uncover your knowledge of the rules, famous players, become a real expert in this field."
        case 1: bottomLabel.text = "Show your strength and become a real basketball quiz champion."
        default: break
        }
        bottomLabel.font = UIFont.systemFont(ofSize: 20)
        bottomLabel.textColor = .white
        bottomLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            bottomLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 10),
            bottomLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            bottomLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor)
        ])
    }
    
    func configureThirdPage(page view: UIView) {
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
            imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            imageView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView1.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4),
            
            imageView2.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: -25),
            imageView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView2.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4),
            
            imageView3.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: -25),
            imageView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            imageView3.heightAnchor.constraint(equalToConstant: self.view.bounds.height/6.5*2)
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
            maleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            maleButton.heightAnchor.constraint(equalToConstant: 50),
            maleButton.widthAnchor.constraint(equalToConstant: 110),
            
            femaleButton.topAnchor.constraint(equalTo: label3.topAnchor, constant: 40),
//            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 35),
            femaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            femaleButton.heightAnchor.constraint(equalToConstant: 50),
            femaleButton.widthAnchor.constraint(equalToConstant: 110),
            
            otherButton.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 15),
//            otherButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
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
    
    func configureNextButton(at page: Int, of view: UIView) {
        let nextButton = UIButton()
        view.addSubview(nextButton)
        nextButton.setImage(UIImage(named: "next\(page+1)"), for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalToConstant: 80),
            nextButton.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        nextButton.addTarget(self, action: #selector(nextButtonAction(sender:)), for: .touchUpInside)
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
    
    func configurePageControl() {
        view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.allowsContinuousInteraction = false
        pageControl.isUserInteractionEnabled = false
        pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        pageControl.setIndicatorImage(UIImage(systemName: "oval.fill"), forPage: 0)

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -25),
            pageControl.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.setIndicatorImage(UIImage(systemName: "circle"), forPage: pageControl.currentPage)
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
        pageControl.setIndicatorImage(UIImage(systemName: "oval.fill"), forPage: pageControl.currentPage)
    }
}

func makeGradientLayer(for view: UIView) {
   let gradient = CAGradientLayer()
   gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
   gradient.startPoint = CGPoint(x: 0, y: 1)
   gradient.endPoint = CGPoint(x: 1, y: 0)
   gradient.frame = view.bounds
   view.layer.addSublayer(gradient)
}

extension UIView {
    func addBlurEffect() {
        var blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        blurredEffectView.alpha = 0.8
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurredEffectView)
    }
}
