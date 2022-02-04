//
//  WebPicture+viewModel.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 04.02.2022.
//

import Combine
import SwiftUI
import CoreData

extension WebPicture {
    class ViewModel: ObservableObject {
        @Published var pictureData: Data?
        @Published var isLoading = false
        @Published var savedPicture: [Picture] = []
        
        private static let cache = NSCache<NSURL, NSData>()
        private var cancellables = Set<AnyCancellable>()
        var context = CoreDataManager.shared.persistentContainer.viewContext
        
        func loadPicture(from url: URL?) {
            isLoading = true
            guard let url = url else {
                isLoading = false
                return
            }
            if let data = Self.cache.object(forKey: url as NSURL) {
                pictureData = data as Data
                isLoading = false
                return
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in
                    if let data = $0 {
                        Self.cache.setObject(data as NSData, forKey: url as NSURL)
                        self?.pictureData = data
                    }
                    self?.isLoading = false
                }
                .store(in: &cancellables)
        }
        
        func downloadPicture() {
            let picture = Picture(context: self.context)
            
            if let pictureData = pictureData {
                picture.content = UIImage(data: pictureData)
                try? self.context.save()
            }
            
        }
        
        func loadSavePicture() {
            let request: NSFetchRequest<Picture> = NSFetchRequest(entityName: "Picture")
            
            do {
                let pictures: [Picture] = try context.fetch(request)
                savedPicture = pictures
            } catch {
                print(error)
            }
        }
    }
}

