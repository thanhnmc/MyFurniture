//
//  ViewController.swift
//  MyFurniture
//
//  Created by nmcthanh on 04/11/2021.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var continueButton: UIButton!

    var screens: BehaviorRelay<[SplashScreen]> = .init(value: [])
    private let disposedBag = DisposeBag()
    private let viewModel = SplashScreenViewModel()
    
    override func viewDidLoad() {
        self.configUI()
        self.callData()
        self.bindData()
    }
   
    private func configUI() {
        continueButton.layer.cornerRadius = 10
        
        collectionView.register(UINib(nibName: "SplashCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SplashCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func callData() {
        self.viewModel.fetchData()
    }

    private func bindData() {
        self.viewModel.screens.bind(to: self.collectionView.rx.items(cellIdentifier: "SplashCollectionViewCell", cellType: SplashCollectionViewCell.self)) { indexPath, item, cell in
            cell.screen.accept(item)
        }.disposed(by: disposedBag)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < viewModel.screens.value.count {
            self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
        }
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
//        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        
//        loginViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
//        self.present(loginViewController, animated: true, completion: nil)
    }
    
}

extension SplashScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SplashCollectionViewCell().size(bounds: self.collectionView.bounds)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
