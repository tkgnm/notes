//
//  LevelView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 16/08/2022.
//

import SwiftUI

struct ContentView: View {

    let levels: [QuestionData] = Bundle.main.decode("levels.json")

    var body: some View {
        NavigationView {
            VStack {
                ForEach(levels) { level in
                    Text("\(level.level)")
                        .font(.system(size: 24, weight: .bold))
                    HStack {
                        ForEach(level.modules) { module in
                            let settings = module.settings
                            NavigationLink {
                                QuestionView(questionManager: QuestionManager(settings: settings))
                            } label: {
                                VStack {
                                    Image(systemName: module.sfSymbol)
                                        .padding()
                                        .overlay(
                                            Circle()
                                                .stroke(Color.primary,
                                                        lineWidth:1))
                                        .scaleEffect(1.5)
                                        .frame(width: 100, height: 100)
                                    Text("\(module.name)")
                                }
                            }
                        }
                    }
                }
                .padding(20)
            }
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
