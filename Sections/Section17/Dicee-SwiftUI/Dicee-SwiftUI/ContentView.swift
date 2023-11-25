//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Paulo Pinheiro on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
         
            VStack {
                Image("diceeLogo")
                Image("dice1")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
