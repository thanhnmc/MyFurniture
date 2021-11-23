//
//  ItemViewModel.swift
//  MyFurniture
//
//  Created by nmcthanh on 23/11/2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import UIKit

struct ItemViewModel {
    var itemList : BehaviorRelay<[Item]> = .init(value: [])
    var catergoryList : BehaviorRelay<[Category]> = .init(value: [])
    
    var items: BehaviorRelay<[SectionModel<ItemSection, Any>]> = .init(value: [])

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
    
    func getItemData() {
        self.itemList
            .withLatestFrom(self.items.asObservable()) { (itemList,items) -> [SectionModel<ItemSection, Any>] in
                guard !itemList.isEmpty else {return items}
                var items = items
                items.append(.init(model: .Horizontal, items: [itemList]))
                items.sort(by: {$0.model < $1.model})
                return items
            }
            .subscribe(onNext: self.items.accept)
            .disposed(by: self.disposedBag)
    }
    
    func getListData() {
        self.itemList
            .withLatestFrom(self.items.asObservable()) { (itemList,items) -> [SectionModel<ItemSection, Any>] in
                guard !itemList.isEmpty else {return items}
                var items = items
                items.append(.init(model: .List, items: [itemList]))
                items.sort(by: {$0.model < $1.model})
                return items
            }
            .subscribe(onNext: self.items.accept)
            .disposed(by: self.disposedBag)
    }
    
    func item(indexPath: IndexPath) -> ItemSection {
        return self.items.value[indexPath.section].identity
    }
    
    func section(index: Int) -> ItemSection {
        return self.items.value[index].model
    }
}
