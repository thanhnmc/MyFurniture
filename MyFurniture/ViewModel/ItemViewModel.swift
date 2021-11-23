//
//  ItemViewModel.swift
//  MyFurniture
//
//  Created by nmcthanh on 23/11/2021.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

struct ItemViewModel {
    var itemList : BehaviorRelay<[Item]> = .init(value: [])
    var catergoryList : BehaviorRelay<[Category]> = .init(value: [])
    
    let disposedBag = DisposeBag()
    
//    func fetchData() -> Observable<[ToDo]> {
    func fetchData() {
        let itemList: [Item] = [
            Item(name: "Lorem Chair", image: UIImage(named: "chair1"), rating: "5", price: "$1000", shortDescription: "Chill, Comfortable", type: Category.chair),
            Item(name: "Lorem Chair", image: UIImage(named: "chair2"), rating: "5", price: "$1000", shortDescription: "Chill, Comfortable", type: Category.chair),
            Item(name: "Lorem Chair", image: UIImage(named: "chair3"), rating: "5", price: "$1000", shortDescription: "Chill, Comfortable", type: Category.chair),
            Item(name: "Lorem Chair", image: UIImage(named: "chair4"), rating: "5", price: "$1000", shortDescription: "Chill, Comfortable", type: Category.chair)
        ]
        self.catergoryList.accept([.chair, .bed, .table])
        self.itemList.accept(itemList)
//        return Observable.just(taskList)
    }
}
