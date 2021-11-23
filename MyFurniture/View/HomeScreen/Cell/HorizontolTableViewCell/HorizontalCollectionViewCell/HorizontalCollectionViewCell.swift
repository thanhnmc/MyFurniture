//
//  HorizontalCollectionViewCell.swift
//  MyFurniture
//
//  Created by nmcthanh on 14/11/2021.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var data: BehaviorRelay<Item?> = .init(value: nil)
    let disposedBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.data.map{$0?.name}.bind(to: self.nameLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.price}.bind(to: self.priceLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.rating}.bind(to: self.ratingLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.image}.bind(to: itemImage.rx.image.asObserver()).disposed(by: self.disposedBag)

    }
    
    func configUI() {
        itemImage.layer.cornerRadius = 16
        
    }

}
