//
//  ContentView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 01/07/2022.
//

import SwiftUI

struct GameView: View {

    @Environment(\.dismiss) var dismiss

    @State var durations: [Duration]

    @State private var pitches: [Pitch] = [.D4, .E4, .F4, .G4, .A4, .B4, .C5, .D5, .E5, .F5, .G5, .A5].shuffled()

    @State private var answers = ["C", "D", "E", "F", "G", "A", "B"]
    @State private var correctAnswer = Int.random(in: 0..<7)
    @State private var score = 0
    @State private var ticker = 10
    @State private var totalQuestions = 0
    @State private var gameOver = false
    @State private var backgroundColor = Color(UIColor.systemBackground)

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Your score is \(score)")
                    .foregroundColor(.primary)
                Spacer()
                ZStack {
                    VStack {
                        StaveView(noteValue: durations[0], pitches: [pitches[0]])
                    }
                }

                HStack {
                    ForEach(0..<answers.count, id:\.self) { number in
                        Button {
                            pitchTapped(number)
                        } label: {
                            Text(answers[number])
                                .font(.headline)
                                .foregroundColor(Color(UIColor.white))
                                .frame(width: 40, height: 80)
                                .background(Color(UIColor.systemBlue))
                                .clipShape(Capsule())
                        }
                    }
                }
                //            .foregroundColor(.primary)
                Spacer()
                Spacer()
            }
            .background(backgroundColor)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("\(ticker)")
            }
        }
        .alert("Game over!", isPresented: $gameOver) {
            Button("Okay") {
                dismiss()
            }
        }
    }

    func pitchTapped(_ number: Int) {
        if totalQuestions == 0 {
            startTimer()
        }

        if answers[number] == pitches[0].rawValue[0] {
            print("Correct")
            score += 1
        } else {
            print("False")
            withAnimation(Animation.easeInOut(duration: 0.1).delay(0)) {
                backgroundColor = Color(UIColor.systemRed).opacity(0.25)
            }
            withAnimation(Animation.easeInOut(duration: 0.1).delay(0.1)) {
                backgroundColor = Color(UIColor.systemBackground)
            }
        }
        totalQuestions += 1
        pitches.shuffle()
        durations.shuffle()
//        parameters.shuffleNotes()
//        value = noteValues.randomElement() ?? .crotchet
        correctAnswer = Int.random(in: 0...6)
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            ticker -= 1
            if ticker == 0 {
                gameOver = true
                timer.invalidate()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(durations: [.crotchet])
            .previewDevice("iPhone 8")
    }
}
