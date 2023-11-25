//
//  ContentView.swift
//  H4X0R
//
//  Created by Paulo Pinheiro on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("H4X0R News")
            
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
        
    }
        
}



//let posts = [
//Post(id: "1", title: "TEste001"),
//Post(id: "2", title: "TEste002"),
//Post(id: "3", title: "TEste003"),]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
