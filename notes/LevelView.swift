//
//  LevelView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 16/08/2022.
//

import SwiftUI

struct LevelView: View {

    var levels = ["Easy", "Hard"]
    @State private var isShowingGameView = false

    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: GameView()) {
                    Circle()
                        .foregroundColor(.blue)
                        .overlay(Text("Easy"))
                        .foregroundColor(.white)
                }

                NavigationLink(destination: GameView()) {
                    Circle()
                        .foregroundColor(.blue)
                        .overlay(Text("Hard"))
                        .foregroundColor(.white)
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
