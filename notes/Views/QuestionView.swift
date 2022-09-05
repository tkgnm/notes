//
//  QuestionView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 27/08/2022.
//

import SwiftUI

struct QuestionView: View {

    @ObservedObject var questionManager: QuestionManager
    @Environment(\.dismiss) var dismiss

    //    @State private var almostOver = false
    //    @State private var timerStarted = false

    var body: some View {
        NavigationView{
            VStack {
                GeometryReader { geometry in
                    HStack {
                        //                        RoundedRectangle(cornerRadius: 5)
                        TimerBar(questionManager: questionManager, initialWidth: geometry.size.width * 0.9)
                        Spacer()
                        Text("\(questionManager.ticker)")
                    }
                }
                .padding()

                Text("Time remaining: \(questionManager.ticker)")
                Spacer()
                Text("You score is \(questionManager.score)/\(questionManager.totalQuestions)")
                    .foregroundColor(.primary)
                Text("Accuracy: \(questionManager.displayAccuracy)")
                Spacer()
                ZStack {
                    VStack {
                        Stave(noteValue: questionManager.duration, pitches: [questionManager.correctAnswer])
                    }
                }

                HStack {
                    ForEach(questionManager.answers, id:\.id) { answer in
                        AnswerButton(questionManager: questionManager, answer: answer)
                    }
                }
                Spacer()
                Spacer()
            }
        }
        .alert("Game over!", isPresented: $questionManager.gameOver) {
            Button("Okay") {
                questionManager.resetGame()
                dismiss()
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questionManager: QuestionManager(settings: Settings(durations: [.crotchet], pitches: [.C5], answers: ["C", "D", "E", "F", "G", "A", "B"])))
    }
}
