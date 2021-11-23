//
//  SplashCollectionViewCell.swift
//  MyFurniture
//
//  Created by nmcthanh on 05/11/2021.
//

import UIKit
import RxSwift
import RxCocoa

class SplashCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var screenToShow: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var screen : BehaviorRelay<SplashScreen?> = .init(value: nil)
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindata()
    }

    func bindata() {
        self.screen.map{$0?.image}.bind(to: screenToShow.rx.image.asObserver()).disposed(by: self.disposeBag)
        self.screen.map{$0?.description}.bind(to: descriptionLabel.rx.text).disposed(by: self.disposeBag)
    }
}

extension SplashCollectionViewCell {
    func size(bounds: CGRect) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height+300)
    }
}
