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
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: questionManager.timerStarted ? 0 : .infinity, height: 10, alignment: .leading)
                        .foregroundColor(questionManager.almostOver ? .red : .blue)
                    Spacer()
                    Text("\(questionManager.ticker)")
                }
                .animation(.linear(duration: Double(questionManager.ticker)), value: questionManager.timerStarted)

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
                    .disabled(questionManager.disabled)
//                    ForEach(0..<questionManager.answers_2.count, id: \.self) { number in
//                        Button {
//                            questionManager.selectAnswer(at: number)
//                        } label: {
//                            Text(questionManager.answers_2[number].answerText)
//                                .font(.headline)
//                                .foregroundColor(Color(UIColor.white))
//                                .frame(width: 40, height: 80)
//                                .background(Color(UIColor.systemBlue))
//                                .clipShape(Capsule())
//                        }
//                        .disabled(questionManager.disabled)
//                    }
                }
                Spacer()
                Spacer()
            }
        }
        .alert("Game over!", isPresented: $questionManager.gameOver) {
            Button("Okay") {
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
