//
//  LevelView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 16/08/2022.
//

import SwiftUI

struct LevelView: View {

    @State private var isShowingGameView = false

    let levels: [Levels] = Bundle.main.decode("levels.json")

    var body: some View {
        NavigationView {
            HStack {
                ForEach(levels) { level in
                    NavigationLink {
                        GameView(durations: level.settings.durations,
                                 pitches: level.settings.pitches, answers: level.settings.answers)
                    } label: {
                        Label("\(level.name)", systemImage: "music.note.list")
//                        Text("\(level.name)")
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan))
//                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(20)
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
