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
    var pitchOffset: CGFloat {
        return pitches[pitch] ?? 0
    }
    
    var body: some View {
        switch value {
        case .quaver:
            NoteImage(value: "\(value)")
                .frame(width: 53)
                .offset(x: 10, y: -36 + pitchOffset)
        case .crotchet:
            NoteImage(value: "\(value)")
                .frame(width: 35)
                .offset(x: 0, y: -36 + pitchOffset)

        case .minim:
            NoteImage(value: "\(value)")
                .frame(width: 40)
                .offset(x: 0, y: -42 + pitchOffset)

        case .semibreve:
            NoteImage(value: "\(value)")
                .frame(width: 45)
                .offset(x: 0, y: 0 + pitchOffset)
        }

    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        Note(value: .quaver, pitch: .C5)
    }
}
