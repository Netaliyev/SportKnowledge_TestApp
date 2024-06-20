import Foundation

struct Quiz {
    var questions = [String]()
    var answers = [[String]]()
    var rightAnswers = [Int]()
    var amountOfQuestions = 6
    let defaults = UserDefaults.standard
    
    func getQuestionsFor(quiz number: Int) {
        
    }
}

struct Question {
    var question: String
    var answers: [String]
    var rightAnswer: Int
}

func writeQuestionForQuiz(number: Int) {
    var quiz = Quiz()
    switch number {
    case 0:
        
        quiz.questions.append("In which club did Messi spend his entire professional career?")
        quiz.questions.append("What is the best club in Italy?")
        quiz.questions.append("Who won the most UCL trophees?")
        quiz.questions.append("Which National team won the most World Cups?")
        quiz.questions.append("In what team did Ronaldo start his professional carreer?")
        quiz.questions.append("In what club did Ibrahimovic retire from professional football?")
        
        quiz.answers.append(["Barcelona", "Real Madrid", "Manchester United", "PSG"])
        quiz.answers.append(["Milan", "Juventus", "Inter", "Napoli"])
        quiz.answers.append(["Milan", "Real Madrid", "Bayern Munich", "Liverpool"])
        quiz.answers.append(["Italy", "Germany", "Brazil", "England"])
        quiz.answers.append(["Manchester United", "Sporting", "Real Madrid", "Porto"])
        quiz.answers.append(["LA Galaxy", "PSG", "Manchester United", "Milan"])
        
        quiz.rightAnswers = [0,0,1,2,1,3]
    default: break
    }
    UserDefaults.standard.set(quiz, forKey: "quiz\(number)")
}
