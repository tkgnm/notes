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

    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack {
                        TimerBar(questionManager: questionManager, initialWidth: geometry.size.width * 0.9)
                        Spacer()
                        Text("\(questionManager.ticker)")
                    }
                }
                .padding()

                Text("You score is \(questionManager.score)/\(questionManager.totalQuestions)")
                    .foregroundColor(.primary)
                Text("Accuracy: \(questionManager.displayAccuracy)")

                ZStack {
                    VStack {
                        Stave(noteValue: questionManager.duration, pitches: [questionManager.correctAnswer])
                    }
                }

                HStack {
                    GeometryReader { geometry in
                        let buttonWidth = geometry.size.width / CGFloat(questionManager.answers.count + 1)

                        HStack(alignment: .center, spacing: buttonWidth / CGFloat(questionManager.answers.count) + 1) {
                            ForEach(questionManager.answers, id:\.id) { answer in
                                AnswerButton(questionManager: questionManager, answer: answer, width: buttonWidth)
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .center)
                    }
                }
                .padding()
//                Spacer()
//                Spacer()
            }
//            .background(Color.grezen)
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
