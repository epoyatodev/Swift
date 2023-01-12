//
//  ProfileViewController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 22/12/22.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var outButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    var heroes: [Heroe] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        let xib = UINib(nibName: "CollectionCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "customCollectionCell")

        heroes = LocalDataLayer.shared.getHeroes()
        
        
        title = "Perfil"
        let token = LocalDataLayer.shared.getToken()
        Networklayer.shared.fetchUser(token: token) { user, error in
            if let user = user {
                
                DispatchQueue.main.async {
                    
                    self.imageProfile.setImage(url: user.photo)
                    self.imageProfile.layer.cornerRadius = self.imageProfile.frame.size.height / 2
                    
                    self.lastNameLabel.text = "\(user.name) \(user.apell1) \(user.apell2) "
                    self.emailLabel.text = user.email
                    
                    self.outButton.layer.cornerRadius = 0.5 * self.outButton.bounds.size.width
                    self.outButton.clipsToBounds = true
                    
                   
                    
                }
                print(user)
               

            } else{
                print("Error al recibir el usuario ", error?.localizedDescription ?? "" )
            }
        }
        
        
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        var cont = 0
        
        for heroe in heroes {
            if heroe.favorite {
                cont = cont + 1
            }
        }
        
        return cont
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CollectionCell
            cell.iconImageView.setImage(url: heroes[indexPath.row].photo)
            cell.titleLabel.text = heroes[indexPath.row].name
           
    
            
       

       return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = (itemsInRow - 1) * spacing
        let finalWidth = (collectionView.frame.width - totalSpacing) / itemsInRow
        
        return CGSize(width: finalWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let detailsView = DetailsViewController()
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
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
