import UIKit

class StudyViewController: UIViewController {
    
    var selectedSport: sportEnum = .football
    var selectedTopic: topicEnum = .clubs
    var selectedOption: StudyTestEnum = .study
    let backButton = UIButton()
    let backgroundIV = UIImageView(image: UIImage(named: "topicBackground"))
    let headLabel = UILabel()
    let rectangleIV = UIImageView(image: UIImage(named: "studyRectangle"))
    let textView = UITextView()
    let titleLabel = UILabel()
    var numberOfRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientLayer(for: view)

        writeInUserDefaults()
        configureUI()
        UserDefaults.standard.set(true, forKey: "isStudyCompleted\(selectedSport.rawValue)\(selectedTopic.rawValue)\(numberOfRow)")
    }
    
    func writeInUserDefaults() {
        let text =  """
Лионель Месси - известный аргентинский футболист, который завоевал сердца миллионов поклонников по всему миру. Он родился 24 июня 1987 года в Росарио, Аргентина, и начал свою профессиональную карьеру в футбольном клубе Барселона, где выступает и по сей день. Месси является рекордсменом по количеству "Золотых мячей" (Ballon d'Or) - престижной награды, вручаемой лучшему футболисту мира. Он победил в этой номинации 6 раз. В 2021 году Лионель Месси сборной Аргентины выиграл Кубок Америки, став капитаном команды и приведя свою страну к победе в турнире. Месси известен своими невероятными футбольными навыками, эффектными дриблингами и уникальным чувством владения мячом. Он установил множество рекордов, включая наибольшее количество голов в одном сезоне Ла Лиги и наибольшее количество голов за один календарный год. В 2021 году Месси перешел в футбольный клуб ПСЖ (Париж Сен-Жермен) после окончания своего долголетнего сотрудничества с Барселоной. Теперь, имея эти факты в виду, ты готов ответить на вопросы квиза о Лионеле Месси. Удачи!
"""

        UserDefaults.standard.set(text, forKey: "questionTextfootballplayers0")
        UserDefaults.standard.set("NUMBER OF PLAYERS ON THE FIELD", forKey: "questionTitlefootballplayers0")
    }
    
    func configureUI() {
        configureBackgroundIV()
        configureBackButton()
        configureHeadLabel()
        configureRectangleIV()
        configureTextView()
    }
    
    //MARK: Button actions
    @objc func backAction() {
        navigationController?.popViewController(animated: true)
    }

}
