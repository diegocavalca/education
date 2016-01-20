//
//  ViewController.swift
//  QuizFinal
//
//  Created by Diego Cavalca on 11/12/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    
    @IBOutlet weak var btnOption0: UIButton!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions : [Question]! // Questões do quiz...
    
    var grade = 0.0         // Nota do quiz...
    var quizEnded = false   // Situacao atual do quiz...
    var currentQuestion = 0 // Questão atual do usuario...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Questão 1...
        let q0answer0 = Answer(pText: "Tigre", pIsCorrect: true)
        let q0answer1 = Answer(pText: "Leão", pIsCorrect: false)
        let q0answer2 = Answer(pText: "Onça", pIsCorrect: false)
        let q0answer3 = Answer(pText: "Pantera", pIsCorrect: false)
        let question0 = Question(pText: "Qual o maior felino do mundo (em dimensões)?", pImage: "gato", pAnswers: [q0answer0, q0answer1, q0answer2, q0answer3])
        
        //let question0 = Question(pQuestion: "Quantos anos vive em média um elefante africano?", pImageFileName: "elefante", pAnswers: [q0answer0, q0answer1, q0answer2])
        
        // Questão 2...
        let q1answer0 = Answer(pText: "Crocodilo", pIsCorrect: true)
        let q1answer1 = Answer(pText: "Lagarto", pIsCorrect: false)
        let q1answer2 = Answer(pText: "Tartaruga", pIsCorrect: false)
        let q1answer3 = Answer(pText: "Cobra", pIsCorrect: false)
        let question1 = Question(pText: "Qual o maior réptil do mundo?", pImage: "reptil", pAnswers: [q1answer0, q1answer1, q1answer2, q1answer3])
        
        // Questão 3...
        let q2answer0 = Answer(pText: "Avestruz", pIsCorrect: true)
        let q2answer1 = Answer(pText: "Urubu", pIsCorrect: false)
        let q2answer2 = Answer(pText: "Ema", pIsCorrect: false)
        let q2answer3 = Answer(pText: "Albatroz", pIsCorrect: false)
        let question2 = Question(pText: "Qual a maior ave do mundo?", pImage: "galinha", pAnswers: [q2answer0, q2answer1, q2answer2, q2answer3])
        
        // Questão 4...
        let q3answer0 = Answer(pText: "Baleia Azul", pIsCorrect: true)
        let q3answer1 = Answer(pText: "Rinorceronte", pIsCorrect: false)
        let q3answer2 = Answer(pText: "Elefante-africano", pIsCorrect: false)
        let q3answer3 = Answer(pText: "Tubarão-baleia", pIsCorrect: false)
        let question3 = Question(pText: "Qual o maior animal vivo no planeta?", pImage: "humano", pAnswers: [q3answer0, q3answer1, q3answer2, q3answer3])
        
        // Questão 5...
        let q4answer0 = Answer(pText: "Píton", pIsCorrect: true)
        let q4answer1 = Answer(pText: "Sucuri", pIsCorrect: false)
        let q4answer2 = Answer(pText: "Anaconda", pIsCorrect: false)
        let q4answer3 = Answer(pText: "Cascavel", pIsCorrect: false)
        let question4 = Question(pText: "Qual a maior cobra do mundo?", pImage: "cobra", pAnswers: [q4answer0, q4answer1, q4answer2, q4answer3])
        
        // Questão 6...
        let q5answer0 = Answer(pText: "Anfíbios", pIsCorrect: true)
        let q5answer1 = Answer(pText: "Répteis", pIsCorrect: false)
        let q5answer2 = Answer(pText: "Aquáticos", pIsCorrect: false)
        let q5answer3 = Answer(pText: "Terrestres", pIsCorrect: false)
        let question5 = Question(pText: "Como se chamam as espécies que podem viver tanto em terra quanto na água?", pImage: "bulbasauro", pAnswers: [q5answer0, q5answer1, q5answer2, q5answer3])
        
        // Juntando questões...
        questions = [question0, question1, question2, question3, question4, question5]
        
        startQuiz()
        
    }
    
    func startQuiz(){
        
        questions.shuffle() // Embaralhando questoes...
        
        for question in questions {
            question.answers.shuffle() // Embaralhando opções de resposta...
        }
        
        // Resetando variaveis de controle do quiz...
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0)
        
    }
    
    func showQuestion(pQuestionId: Int){
        
        // Controlando componentes...
        btnOption0.enabled = true
        btnOption1.enabled = true
        btnOption2.enabled = true
        btnOption3.enabled = true
        
        // Inicializando dados da questão...
        lbQuestion.text = questions[pQuestionId].text
        imgQuestion.image = questions[pQuestionId].image
        btnOption0.setTitle(questions[pQuestionId].answers[0].text, forState: UIControlState.Normal)
        btnOption1.setTitle(questions[pQuestionId].answers[1].text, forState: UIControlState.Normal)
        btnOption2.setTitle(questions[pQuestionId].answers[2].text, forState: UIControlState.Normal)
        btnOption3.setTitle(questions[pQuestionId].answers[3].text, forState: UIControlState.Normal)
        
    }
    
    @IBAction func chooseOption0(sender: AnyObject) {
        selectAnswer(0)
    }
    
    @IBAction func chooseOption1(sender: AnyObject) {
        selectAnswer(1)
    }
    
    @IBAction func chooseOption2(sender: AnyObject) {
        selectAnswer(2)
    }
    
    @IBAction func chooseOption3(sender: AnyObject) {
        selectAnswer(3)
    }
    
    func selectAnswer(pAnswerId: Int){
        
        // Controlando componentes...
        btnOption0.enabled = false
        btnOption1.enabled = false
        btnOption2.enabled = false
        btnOption3.enabled = false
        viewFeedback.hidden = false
        
        var answer = questions[currentQuestion].answers[pAnswerId];
        
        // Corrigir...
        if(answer.isCorrect == true){
            grade = grade + 1.0
            lbFeedback.text = answer.text + "\n\nResposta Correta!"
        }else{
            lbFeedback.text = answer.text + "\n\nResposta errada..."
        }
        
        // Situação do quiz...
        if(currentQuestion < questions.count-1){
            btnFeedback.setTitle("PRÓXIMA PERGUNTA", forState: UIControlState.Normal)
        }else{
            btnFeedback.setTitle("VER PONTUAÇÃO", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
 
        viewFeedback.hidden = true
        
        if(quizEnded){
            startQuiz() // Recomeçar...
        }else{
            nextQuestion() // Próxima...
        }

    }
    
    func nextQuestion(){
        
        currentQuestion++
        
        // Situação do quiz...
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
        
    }
    
    func endQuiz(){
        var pGrade = grade / Double(questions.count) * 100
        quizEnded = true
        viewFeedback.hidden = false
        lbFeedback.text = "Você acertou \(Int(grade)) de \(questions.count) questões!"
        btnFeedback.setTitle("TENTAR DENOVO!", forState: UIControlState.Normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

