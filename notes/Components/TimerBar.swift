//
//  TimerBar.swift
//  experiment wiht offset
//
//  Created by Thomas King on 05/09/2022.
//

import SwiftUI

struct TimerBar: View {

    @ObservedObject var questionManager: QuestionManager

    @State var initialWidth: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: questionManager.timerStarted ? 0 : initialWidth, height: 10, alignment: .leading)
            .animation(.linear(duration: Double(questionManager.ticker)), value: questionManager.timerStarted)
            .foregroundColor(questionManager.almostOver ? .red : .blue)
    }
}
