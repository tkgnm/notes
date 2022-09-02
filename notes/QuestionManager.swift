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
    var answers = [String]()

    var answers_2 = [Answer]()

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

    @Published var disabled = false

    init(settings: Settings) {
        self.settings = settings

//        appending settings to empty arrays
        durations += settings.durations
        pitches += settings.pitches
        answers += settings.answers

        self.correctAnswer = pitches.randomElement()!
        self.duration = durations.randomElement()!

        for answer in answers {
            if answer == self.correctAnswer.rawValue[0] {
                answers_2.append(Answer(answerText: answer, isCorrect: true))
            } else {
                answers_2.append(Answer(answerText: answer, isCorrect: false))
            }
        }
    }

//    gets new question for the player
    func setQuestion() {
        correctAnswer = pitches.randomElement()!
        duration = durations.randomElement()!
        answers_2.removeAll()

        for answer in answers {
            if answer == self.correctAnswer.rawValue[0] {
                answers_2.append(Answer(answerText: answer, isCorrect: true))
            } else {
                answers_2.append(Answer(answerText: answer, isCorrect: false))
            }
        }
    }

    func submitAnswer(_ answer: Answer) {

        print (answer.isCorrect)

        if totalQuestions == 0 {
            startTimer()
        }

        if answer.isCorrect {
            score += 1
        } else {
//            disabled = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.disabled = false
//            }
        }

        totalQuestions += 1

        accuracy = Double(score) / Double(totalQuestions)
        displayAccuracy = calculateAccuracy(for: accuracy)
        setQuestion()

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
