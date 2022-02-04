//
//  FavouriteView.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 01.02.2022.
//

import SwiftUI

struct FavouriteView: View { 
    @StateObject private var viewModel = WebPicture.ViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(viewModel.savedPicture, id: \.self) {picture in
                    ZStack{
                        Image(uiImage: picture.content!)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 10, x: 5, y: 0)
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    viewModel.context.delete(picture)
                                    do {
                                        try viewModel.context.save()
                                    } catch {
                                        print(error)
                                    }
                                    viewModel.loadSavePicture()
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(Color.pink)
                                        .offset(x: -10, y: 10)
                                }
                            }
                            .padding()
                    }
                }
            }.navigationTitle("Избранное")
        }.onAppear{
            viewModel.loadSavePicture()
        }
    }
}


struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
