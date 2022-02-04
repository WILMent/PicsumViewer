//
//  ContentView.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ListView()
                .tabItem{
                    Label("Картинки", systemImage: "rectangle.stack")
                }
            FavouriteView()
                .tabItem{
                    Label("Избранное", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
