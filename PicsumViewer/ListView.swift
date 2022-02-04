//
//  ListView.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 01.02.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var countPicture = 15
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack {
                    ForEach(1...countPicture, id: \.self) { picture in
                        WebPicture(url: URL(string: "https://picsum.photos/300?=\(UUID().uuidString)"))
                            .onAppear {
                                if picture == countPicture - 2 {
                                    countPicture += 15
                                }
                            }
                    }
                }
            }.navigationTitle("Все картинки")
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
