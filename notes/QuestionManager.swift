//
//  QuestionManager.swift
//  experiment wiht offset
//
//  Created by Thomas King on 26/08/2022.
//

import Foundation

class QuestionManager: ObservableObject {

    let settings: Settings
    
    var durations = [Duration]()
    var pitches = [Pitch]()
    var answers = [Answer]()

//   variables to keep track of score
    @Published var score = 0
    @Published var totalQuestions = 0
    @Published var accuracy: Double = 0
    @Published var displayAccuracy: String = "0%"

//   variables that set the answer
    @Published var correctAnswer: Pitch
    @Published var duration: Duration

//  variables that determine game logic
    @Published var answerSelected = false
    @Published var gameOver = false

//  timer variables
    @Published var ticker = 10
    @Published var almostOver = false
    @Published var timerStarted = false

    @Published var previousCorrect = true

    init(settings: Settings) {
        self.settings = settings

//        appending settings to empty arrays
        durations += settings.durations
        pitches += settings.pitches

        self.correctAnswer = pitches.randomElement()!
        self.duration = durations.randomElement()!

        answers = settings.answers.map { answer in
            Answer(answerText: answer, isCorrect: answer == self.correctAnswer.rawValue[0] ? true : false)
        }
    }

//    gets new question for the player
    func setQuestion() {
        answerSelected = false
        correctAnswer = pitches.randomElement()!
        duration = durations.randomElement()!
        answers = answers.map { answer in
            Answer(answerText: answer.answerText, isCorrect: answer.answerText == self.correctAnswer.rawValue[0] ? true : false)
        }
    }

    func submitAnswer(_ answer: Answer) {
        answerSelected = true

        if totalQuestions == 0 {
            startTimer()
        }

        if answer.isCorrect, previousCorrect == true {
            score += 1
            setQuestion()
            totalQuestions += 1
        } else if answer.isCorrect, previousCorrect == false {
            previousCorrect = true
            setQuestion()
        } else {
            previousCorrect = false
            totalQuestions += 1
        }

        accuracy = Double(score) / Double(totalQuestions)
        displayAccuracy = calculateAccuracy(for: accuracy)

    }

//    converts a double to a percentage as a string
    func calculateAccuracy(for double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter.string(from: NSNumber(value: accuracy)) ?? "0"
    }

    func resetGame() {
        score = 0
        ticker = 10
        totalQuestions = 0
        accuracy = 0
        displayAccuracy = "0%"
    }

    func startTimer() {
        timerStarted = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.ticker -= 1
            if self.ticker <= 0 {
                self.gameOver = true
                self.resetGame()
                timer.invalidate()
            }
            if self.ticker <= 3 {
                self.almostOver = true
            }
        }
    }
}
