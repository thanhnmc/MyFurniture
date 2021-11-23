//
//  SplashScreenViewModel.swift
//  MyFurniture
//
//  Created by nmcthanh on 05/11/2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct SplashScreen {
    var image: UIImage
    var description: String
}

struct SplashScreenViewModel {
    var screens: BehaviorRelay<[SplashScreen]> = .init(value: [])
    
    func fetchData() {
        let screens: [SplashScreen] = [
            SplashScreen(image: UIImage(named: "image1")!, description: "Your perfect interior design"),
            SplashScreen(image: UIImage(named: "image2")!, description: "Find your best furniture"),
            SplashScreen(image: UIImage(named: "image3")!, description: "We send your best furniture")
        ]
        
        
        self.screens.accept(screens)
    }
}
