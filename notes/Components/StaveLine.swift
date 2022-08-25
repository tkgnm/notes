//
//  StaveLineView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 31/07/2022.
//

import SwiftUI

struct StaveLine: View {
    
    let width: CGFloat = 300
    var padding: CGFloat = 4
    let height: CGFloat = 4
    
    var body: some View {
        Color.primary
            .frame(width: width, height: height, alignment: .center)
            .padding(padding)
    }
}

struct StaveLineView_Previews: PreviewProvider {
    static var previews: some View {
        StaveLine()
    }
}
