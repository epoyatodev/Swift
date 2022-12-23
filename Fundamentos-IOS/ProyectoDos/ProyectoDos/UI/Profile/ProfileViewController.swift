//
//  ProfileViewController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 22/12/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Perfil"
        // Do any additional setup after loading the view.
    }


   
    @IBAction func logoutButtomTapped(_ sender: Any) {
        
        LocalDataLayer.shared.deleteToken()
        DispatchQueue.main.async {
            // deprecated form
            //UIApplication.shared.keyWindow?.rootViewController = HomeTabBarController()
            
            
            // oficial form
            UIApplication.shared.connectedScenes.compactMap{ ($0 as? UIWindowScene)?.keyWindow }.first?.rootViewController = LoginViewController()

        }
        
    }
}
