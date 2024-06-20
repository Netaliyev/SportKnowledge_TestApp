//
//  StatisticViewController.swift
//  SportKnowledge_TestApp
//
//  Created by Nadir Netaliyev on 10.02.2024.
//

import UIKit

class StatisticViewController: UIViewController {
    
    let backgroundIV = UIImageView(image: UIImage(named: "statisticBackground"))
    
    let statisticHeadLabel = UILabel()
    let backgroundIV1 = UIImageView(image: UIImage(named: "statisticRectangle1")!)
    let backgroundIV2 = UIImageView(image: UIImage(named: "statisticRectangle2")!)
    let scrollView = UIScrollView()
    let cupArray: [UIImageView] = {
        var result = [UIImageView]()
        for _ in 0..<6 {
            let imageView = UIImageView(image: UIImage(named: "notachievedCup")!)
            result.append(imageView)
        }
        return result
    }()
    let achievementNames = [
        "Complete the soccer players quiz",
        "Complete the football clubs quiz",
        "Complete the soccer rules quiz",
        "Complete the basketball players quiz",
        "Complete the basketball clubs quiz",
        "Complete the basketball rules quiz"
    ]
    let statisticLabel = UILabel()
    let numberOfQuestionsLabel = UILabel()
    let pieChartView = PieChartView()
    let greenCircleIV = UIImageView(image: UIImage(named: "greenCircle"))
    let redCircleIV = UIImageView(image: UIImage(named: "redCircle"))
    let rightAnswerLabel = UILabel()
    let wrongAnswerLabel = UILabel()
    var correctAnswerCounter = 0
    var wrongAnswerCounter = 0
    var pieChartContainerView = UIImageView(image: UIImage(named: "pieChartLayer"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAnswerStatistic()
        configureUI()
    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        pieChartContainerView.layoutIfNeeded()
//        applyCircularBlur()
//    }
    
    func getAnswerStatistic() {
        correctAnswerCounter = 0
        wrongAnswerCounter = 0
        for i in 0..<12 {
            sportEnum.allCases.forEach { sport in
                topicEnum.allCases.forEach { topic in
                    correctAnswerCounter += UserDefaults.standard.integer(forKey: "correctStat\(sport.rawValue)\(topic.rawValue)\(i)")
                    wrongAnswerCounter += UserDefaults.standard.integer(forKey: "wrongStat\(sport.rawValue)\(topic.rawValue)\(i)")
                }
            }
        }
    }
    
    func configureUI() {
        configureBackgroundIV()
        configureStatLabel()
        configureBackgroundIV1()
        configureBackgroundIV2()
        configureScrollView()
        configureCups()
        configureSecondRectangleLabels()
//        configureChartBackground()
        configurePieChart()
        configureCircles()
        configureAnswerStatisticLabels()
    }
}


