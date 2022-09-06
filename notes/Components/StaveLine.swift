//
//  StaveLineView.swift
//  experiment wiht offset
//
//  Created by Thomas King on 31/07/2022.
//

import SwiftUI

struct StaveLine: View {
    
    var width: CGFloat = 300
    var thickness: CGFloat = 4
    
    var body: some View {
        Color.primary
            .frame(width: width, height: thickness, alignment: .center)
//            .padding(.vertical, padding)
    }
}

struct StaveLineView_Previews: PreviewProvider {
    static var previews: some View {
        StaveLine()
    }
}
