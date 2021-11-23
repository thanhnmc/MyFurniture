//
//  HorizontalTableViewCell.swift
//  MyFurniture
//
//  Created by nmcthanh on 23/11/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HorizontalTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let bag = DisposeBag()
    
    var items : BehaviorRelay<[Item]> = .init(value: [])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "HorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        
        bindData()
        self.collectionView.delegate = self
        self.collectionView.showsHorizontalScrollIndicator = false
    }

    func bindData() {
        self.items.bind(to: self.collectionView.rx.items(cellIdentifier: "HorizontalCollectionViewCell", cellType: HorizontalCollectionViewCell.self)) { indexPath, item, cell in
            cell.data.accept(item)
        }.disposed(by: bag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HorizontalTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 209)
    }
    
}
