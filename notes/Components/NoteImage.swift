//
//  ImageRenderView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 31/07/2022.
//

import SwiftUI

struct NoteImage: View {
    
    var value: String
    
    var body: some View {
        Image(value)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.primary)
            .aspectRatio(contentMode: .fit)

//            .foregroundColor(.red)
    }
}

struct ImageRenderView_Previews: PreviewProvider {
    static var previews: some View {
        NoteImage(value: "crotchet")
    }
}
