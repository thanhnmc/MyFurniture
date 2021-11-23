//
//  TabItem.swift
//  Capstone_nqhuy9
//
//  Created by Nghiêm Huy on 7/13/21.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case home = "Home"
    case discount = "Discount"
    case buy = "Buy"
    case profile = "Profile"
    

    var viewController: UIViewController {
        switch self {
        case .home:
            let sb = UIStoryboard(name: HomeViewController.identifier, bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: HomeViewController.identifier) as? HomeViewController else { return UIViewController() }
            return vc
        case .discount:
            let viewController = DiscountViewController(nibName: DiscountViewController.identifier, bundle: nil)
            return viewController
        case .buy:
            let viewController = CheckoutViewController(nibName: CheckoutViewController.identifier, bundle: nil)
            return viewController
        case .profile:
            let viewController = ProfileViewController(nibName: ProfileViewController.identifier, bundle: nil)
            return viewController
        }
    }

    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "Home")!
        case .discount:
            return UIImage(named: "Discount")!
        case .buy:
            return UIImage(named: "Buy")!
        case .profile:
            return UIImage(named: "Profile")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
