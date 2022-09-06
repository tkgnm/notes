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
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        HStack {
                            TimerBar(questionManager: questionManager, initialWidth: geometry.size.width * 0.9)
                            Spacer()
                            Text("\(questionManager.ticker)")
                        }
                    }

                    Spacer()

                    HStack {
                        Text("Score: \(questionManager.score)/\(questionManager.totalQuestions)")
                        Spacer()
                        Text("Accuracy: \(questionManager.displayAccuracy)")
                    }
                    .foregroundColor(.primary)
                }
                .frame(maxHeight: 80)
                .padding()

                Spacer()

                Stave(noteValue: questionManager.duration, pitches: [questionManager.correctAnswer], clef: questionManager.settings.clef)
                    .frame(maxHeight: 600)

                Spacer()

                HStack {
                    GeometryReader { geometry in
                        let buttonWidth = geometry.size.width / CGFloat(questionManager.answers.count + 1)

                        HStack(alignment: .center, spacing: buttonWidth / CGFloat(questionManager.answers.count) + 1) {
                            ForEach(questionManager.answers, id:\.id) { answer in
                                AnswerButton(questionManager: questionManager, answer: answer, width: buttonWidth)
                            }
                        }
//                        .frame(width: geometry.size.width, alignment: .center)
                    }
                    .frame(maxHeight: 100)
                }
                .padding()
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
