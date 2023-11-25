//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Paulo Pinheiro on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 3
    
    func randomNumbers() {
        self.leftDiceNumber = Int.random(in: 1...6)
        self.rightDiceNumber = Int.random(in: 1...6)
    }
    
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
                    DiceView(n: leftDiceNumber)
                    Spacer()
                    DiceView(n: rightDiceNumber)
                    
                }
                .padding()
                Spacer()
                Button(action: {
                 randomNumbers()
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
