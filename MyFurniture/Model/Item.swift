//
//  Item.swift
//  MyFurniture
//
//  Created by nmcthanh on 19/11/2021.
//

import Foundation
import UIKit

enum Category: String {
    case chair = "chair"
    case bed = "bed"
    case table = "table"
}

struct Item { 
    var name: String
    var image: UIImage?
    var rating: String
    var price: String
    var shortDescription: String
    var type: Category
}

enum ItemSection: Int, Comparable {
    case Horizontal = 1
    case List = 2
    
    static func < (lhs: ItemSection, rhs: ItemSection) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
