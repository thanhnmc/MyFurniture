//
//  LoginViewController.swift
//  MyFurniture
//
//  Created by nmcthanh on 08/11/2021.
//

import UIKit

class LoginViewController: BaseVC {

    @IBOutlet weak var emailViewContainer: UIView!
    @IBOutlet weak var passwordViewContainer: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configUI() {
        emailViewContainer.layer.cornerRadius = 8
        passwordViewContainer.layer.cornerRadius = 8
        emailViewContainer.layer.borderWidth = 1
        passwordViewContainer.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 8
        googleButton.layer.cornerRadius = 8
        googleButton.layer.borderWidth = 1
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        self.navigationController?.pushViewController(HomeViewController(nibName: HomeViewController.identifier, bundle: nil), animated: true)
        let sb = UIStoryboard(name: HomeViewController.identifier, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "NavigationHome") as? UINavigationController else { return }
        view.window?.rootViewController = vc
    }
    
    @IBAction func googleButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let signUpViewController = SignUpViewController(nibName: SignUpViewController.identifier, bundle: nil)
        signUpViewController.modalPresentationStyle = .fullScreen
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
}
