//
//  WebPicture.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 02.02.2022.
//

import Combine
import SwiftUI

struct WebPicture: View {
    @StateObject private var viewModel = ViewModel()
    
    let url: URL?
    
    var body: some View {
        Group {
            if let data = viewModel.pictureData, let uiImage = UIImage(data: data) {
                ZStack{
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 10, x: 5, y: 0)
                        .overlay(alignment: .topTrailing) {
                            Button {
                                viewModel.downloadPicture()
                            } label: {
                                Image(systemName: "heart")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.pink)
                                    .offset(x: -10, y: 10)
                            }
                        }
                        .padding()
                }
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFill()
            }
        }
        .onAppear {
            viewModel.loadPicture(from: url)
        }
    }
}
