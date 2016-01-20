//
//  QuizModel.swift
//  QuizFinal
//
//  Created by Diego Cavalca on 11/12/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import Foundation
import UIKit

class Question{

    var text : String!
    var image : UIImage!
    var answers : [Answer]!
    
    init(pText: String, pImage: String, pAnswers: [Answer]){
        self.text = pText
        self.image = UIImage(named: pImage)
        self.answers = pAnswers
    }
    
}

class Answer{
    
    var text : String!
    var isCorrect : Bool!
    
    init(pText: String, pIsCorrect: Bool){
        self.text = pText
        self.isCorrect = pIsCorrect
    }

}