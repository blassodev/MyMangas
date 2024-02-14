//
//  ContentView.swift
//  MyMangas
//
//  Created by Blas Santome Ocampo on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem() {
                    Image(systemName: "safari.fill")
                    Text("Explorar")
                }
            LibraryView()
                .tabItem() {
                    Image(systemName: "books.vertical.fill")
                    Text("Mi biblioteca")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
