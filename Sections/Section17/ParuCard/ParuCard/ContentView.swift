//
//  ContentView.swift
//  ParuCard
//
//  Created by Paulo Pinheiro on 11/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(.cyan))
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("1631360242543")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 7))
                    .overlay(Circle().stroke(Color.cyan, lineWidth: 2))
                
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Paulo Pinheiro")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Text("iOS Developer")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Spacer()
                Divider()

                InfoView(text: "  +55 71 99637-5858", imageName: "phone.fill")
                
                InfoView(text: "  paruvitu@gmail.com", imageName: "mail.fill")

                    

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
