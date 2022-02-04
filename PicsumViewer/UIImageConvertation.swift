//
//  UIImageConvertation.swift
//  PicsumViewer
//
//  Created by DANIIL TRETIAKOV on 02.02.2022.
//

import Foundation
import UIKit

class UIImageConvertation: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let picture = value as? UIImage else { return nil }
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: picture, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do{
            let picture = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return picture
        } catch {
            return nil
        }
    }
}
