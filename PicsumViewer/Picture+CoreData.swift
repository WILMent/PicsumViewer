//
//  Picture+CoreData.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 02.02.2022.
//

import Foundation
import CoreData
import UIKit

@objc(Picture)
class Picture: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Picture> {
        return NSFetchRequest<Picture>(entityName: "Picture")
    }
    
    @NSManaged public var content: UIImage?
    
}

extension Picture : Identifiable {
    
}
