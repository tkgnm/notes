//
//  noteView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 06/07/2022.
//

import Foundation
import SwiftUI

struct Note: View {
    
    var value: Duration
    var pitch: Pitch
    var clef: Clef
    var halfSpaceMultiplier: CGFloat = 10

    var pitchOffset: CGFloat {
        switch clef {
            case .treble:
                return treblePitches[pitch] ?? 0
            case .bass:
                return bassPitches[pitch] ?? 0
        }
    }
    
    var body: some View {
        switch value {
        case .quaver:
            NoteImage(value: "\(value)")
                .frame(width: 53)
                .offset(x: 10, y: -36 + pitchOffset * halfSpaceMultiplier)
        case .crotchet:
            NoteImage(value: "\(value)")
                .frame(width: 35)
                .offset(x: 0, y: -36 + pitchOffset * halfSpaceMultiplier)

        case .minim:
            NoteImage(value: "\(value)")
                .frame(width: 40)
                .offset(x: 0, y: -42 + pitchOffset * halfSpaceMultiplier)

        case .semibreve:
            NoteImage(value: "\(value)")
                .frame(width: 45)
                .offset(x: 0, y: 0 + pitchOffset * halfSpaceMultiplier)
        }

    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        Note(value: .quaver, pitch: .C5, clef: .treble)
    }
}
