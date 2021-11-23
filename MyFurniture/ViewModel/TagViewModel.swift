//
//  TagViewModel.swift
//  MyFurniture
//
//  Created by nmcthanh on 12/11/2021.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

struct Tag {
    var name: String
}

struct TagViewModel {
    var tags: BehaviorRelay<[Tag]> = .init(value: [])

    func fetchData() {
        let tags: [Tag] = [
            Tag(name: "Chair"),
            Tag(name: "Table"),
            Tag(name: "Bed"),
            Tag(name: "Carpet"),
            Tag(name: "TV")
        ]
        
        self.tags.accept(tags)
    }
}
