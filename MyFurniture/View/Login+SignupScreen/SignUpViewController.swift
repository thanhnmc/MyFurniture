//
//  SignUpViewController.swift
//  MyFurniture
//
//  Created by nmcthanh on 08/11/2021.
//

import UIKit

class SignUpViewController: BaseVC {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func configUI() {
        fullNameTextField.layer.cornerRadius = 8
        emailTextField.layer.cornerRadius = 8
        phoneTextField.layer.cornerRadius = 8
        passwordTextField.layer.cornerRadius = 8
        confirmPasswordTextField.layer.cornerRadius = 8
        registerButton.layer.cornerRadius = 8
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let signUpSuccessViewController = SignUpSuccessViewController(nibName: SignUpSuccessViewController.identifier, bundle: nil)
        signUpSuccessViewController.modalPresentationStyle = .fullScreen
        self.present(signUpSuccessViewController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    
    
}
