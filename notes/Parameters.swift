//
//  Parameters.swift
//  experiment wiht offset
//
//  Created by Thomas King on 19/08/2022.
//

import Foundation

enum Difficulty {
    case easy, hard
}

class Parameters: ObservableObject {

    @Published var noteValues: [NoteValue]

    init(difficulty: Difficulty) {

        switch difficulty {
            case .easy:
                noteValues = [.crotchet]

            case .hard:
                noteValues = [.quaver, .crotchet, .minim, .semibreve]
        }

    }

    func shuffleNotes() {
        noteValues.shuffle()
    }

}
