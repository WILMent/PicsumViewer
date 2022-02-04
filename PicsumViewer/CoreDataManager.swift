//
//  CoreDataManager.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 02.02.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        ValueTransformer.setValueTransformer(UIImageConvertation(), forName: NSValueTransformerName("UIImageConvertation"))
        persistentContainer = NSPersistentContainer(name: "PictureDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
