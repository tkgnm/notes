//
//  AnswerButton.swift
//  experiment wiht offset
//
//  Created by Thomas King on 02/09/2022.
//

import SwiftUI

struct AnswerButton: View {

    @ObservedObject var questionManager: QuestionManager
    var answer: Answer
    @State private var isSelected = false


    var body: some View {
        Text(answer.answerText)
            .font(.headline)
            .foregroundColor(Color(UIColor.white))
            .frame(width: 40, height: 80)
            .background(Color(UIColor.systemBlue))
            .clipShape(Capsule())
            .onTapGesture {
                questionManager.submitAnswer(answer)
            }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(questionManager: QuestionManager(settings: Settings(durations: [.crotchet], pitches: [.C5], answers: ["C5"])), answer: Answer(answerText: "C5", isCorrect: true))
    }
}
