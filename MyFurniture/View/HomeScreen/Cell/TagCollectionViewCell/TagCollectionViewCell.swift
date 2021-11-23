//
//  TagCollectionViewCell.swift
//  MyFurniture
//
//  Created by nmcthanh on 12/11/2021.
//

import UIKit
import RxCocoa
import RxSwift

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    
    var tagName : BehaviorRelay<Tag?> = .init(value: nil)

    private let disposedBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindata()
    }

    func configUI() {
        viewContainer.layer.cornerRadius = 10
        viewContainer.layer.borderWidth = 1
    }
    
    func bindata() {
        self.tagName.map{$0?.name}.bind(to: tagLabel.rx.text).disposed(by: self.disposedBag)
    }
}
