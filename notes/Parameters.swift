//
//  Parameters.swift
//  experiment wiht offset
//
//  Created by Thomas King on 19/08/2022.
//

import Foundation

enum Difficulty_2 {
    case easy, hard
}

class Parameters: ObservableObject {

    @Published var durations: [Duration]


    init(difficulty: Difficulty_2) {

        switch difficulty {
            case .easy:
                durations = [.crotchet]

            case .hard:
                durations = [.quaver, .crotchet, .minim, .semibreve]
        }

    }
    
    func shuffleNotes() {
        durations.shuffle()
    }

}
