//
//  SignUpSuccessViewController.swift
//  MyFurniture
//
//  Created by nmcthanh on 08/11/2021.
//

import UIKit

class SignUpSuccessViewController: UIViewController {

    @IBOutlet weak var loginNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }

    private func configUI() {
        loginNowButton.layer.cornerRadius = 8
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
}
