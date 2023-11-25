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
                Spacer()
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: 2)
                    Spacer()
                    DiceView(n: 6)
                    
                }
                .padding()
                Spacer()
                Button(action: {
                    
                }) {
                    Text("ROLL")
                        .font(.system(size: 50, weight: .heavy))
                        .foregroundColor(.white)
                }
                .background(Color.red)
                
                Spacer()
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

struct DiceView: View {
    
    var n: Int
    var body: some View {
        Image("dice\(n)")
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .aspectRatio(1, contentMode: .fill)
            
    }
}
