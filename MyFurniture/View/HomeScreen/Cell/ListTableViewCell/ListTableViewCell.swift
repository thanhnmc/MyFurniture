//
//  ListTableViewCell.swift
//  MyFurniture
//
//  Created by nmcthanh on 14/11/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var data: BehaviorRelay<Item?> = .init(value: nil)
    let disposedBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 5
        
        self.data.map{$0?.name}.bind(to: self.nameLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.price}.bind(to: self.priceLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.shortDescription}.bind(to: self.shortDescriptionLabel.rx.text).disposed(by: disposedBag)
        self.data.map{$0?.image}.bind(to: itemImage.rx.image.asObserver()).disposed(by: self.disposedBag)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
