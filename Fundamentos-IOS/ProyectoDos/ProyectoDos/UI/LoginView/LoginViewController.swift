//
//  LoginViewController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 18/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButtom: UIButton!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtom.layer.masksToBounds = true
        loginButtom.layer.cornerRadius = 5

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(openKeyBoard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(closeKeyBoard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func openKeyBoard() {
        print("open keyBoard")
    }
    
    @objc func closeKeyBoard() {
        print("close keyBoard")
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        emailTextField.center.x -= view.bounds.width
        passwordTestField.center.x -= view.bounds.width
        loginButtom.alpha = 0
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: []) {
            self.emailTextField.center.x += self.view.bounds.width
            self.passwordTestField.center.x += self.view.bounds.width

        }
        
        UIView.animate(withDuration: 3) {
            self.loginButtom.alpha = 1
        }
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            print("email is empty")
            return
        }
        guard let password = passwordTestField.text, !password.isEmpty else {
            print("pasword is empty")
            return
        }
        Networklayer.shared.login(email: email, password: password) { token, error in
            if let token = token {
                LocalDataLayer.shared.save(token: token)
                print(token)
                DispatchQueue.main.async {
                    // deprecated form
                    //UIApplication.shared.keyWindow?.rootViewController = HomeTabBarController()
                    
                    
                    // oficial form
                    UIApplication.shared.connectedScenes.compactMap{ ($0 as? UIWindowScene)?.keyWindow }.first?.rootViewController = HomeTabBarController()

                }
                
            }else{
                print("Login error: ", error?.localizedDescription ?? "")
            }
        }
    }
    
}
