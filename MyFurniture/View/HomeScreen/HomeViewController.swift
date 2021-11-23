//
//  HomeViewController.swift
//  MyFurniture
//
//  Created by nmcthanh on 09/11/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewController: BaseVC {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var tableView: UITableView!
    
    
    let disposedBag = DisposeBag()
    private let tagViewModel = TagViewModel()
    private let itemViewModel = ItemViewModel()
    
    var datasources: RxTableViewSectionedReloadDataSource<SectionModel<ItemSection, Any>>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        self.tableView.register(UINib(nibName: "HorizontalTableViewCell", bundle: nil), forCellReuseIdentifier: "HorizontalTableViewCell")
        self.tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")

        self.configUI()
        self.callData()
        self.bindData()
    }

    private func configUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = nil
        self.collectionView.delegate = self
        self.collectionView.dataSource = nil
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func callData() {
        self.tagViewModel.fetchData()
    }

    private func bindData() {
        self.tagViewModel.tags.bind(to: self.collectionView.rx.items(cellIdentifier: "TagCollectionViewCell", cellType: TagCollectionViewCell.self)) { indexPath, item, cell in
            cell.tagName.accept(item)
        }.disposed(by: disposedBag)
        
        self.datasources = .init(configureCell: { datasources, tableView, indexPath, items in
            let section = datasources.sectionModels[indexPath.section].identity
            switch section {
            case .Horizontal:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalTableViewCell", for: indexPath) as? HorizontalTableViewCell else { return UITableViewCell() }
                cell.items.accept(items as! [Item])
                return cell
            case .List:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
                cell.data.accept(items as? Item)
                return cell
            }
        })
        
    }
}

// MARK: UITAableView delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
}

//MARK: UICollectionView Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


