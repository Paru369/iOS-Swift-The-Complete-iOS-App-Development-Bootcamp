//
//  InfoView.swift
//  ParuCard
//
//  Created by Paulo Pinheiro on 11/23/23.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius:  5)
              .frame(width: 300.0, height: 30.0)
              .foregroundColor(Color.white)
              .overlay(
                  HStack{ Image(systemName: imageName)
                          .foregroundColor(.blue)
                      Text(text)
                  })
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "teste", imageName: "globe")
    }
}
