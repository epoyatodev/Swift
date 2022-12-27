//
//  DetailsViewController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 21/12/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var transformationDetails: UIButton!
    @IBOutlet weak var descriptionDetailLabel: UILabel!
    @IBOutlet weak var favoriteButtonLabel: UIButton!
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    
    var heroe: Heroe!
    var transformations: [Tranformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transformationDetails.alpha = 0
        favoriteButtonLabel.configuration?.title = "Añadir a favoritos ❤️"
        title = heroe.name
        
        imageDetails.setImage(url: heroe.photo)
        nameDetailLabel.text = heroe.name
        descriptionDetailLabel.text = heroe.description
        
        if heroe.favorite {
            favoriteButtonLabel.configuration?.title = "Quitar de favoritos 💔"
        }
        
        
        let token = LocalDataLayer.shared.getToken()
        
        Networklayer.shared.fetchTransformations(token: token, heroeId: heroe.id) { [weak self] allTrans, error in
            
            guard let self = self else {return}
            
            if let allTrans = allTrans {
                self.transformations = allTrans
                
                if !self.transformations.isEmpty {
                    DispatchQueue.main.async {
                        self.transformationDetails.alpha = 1
                    }
                }
                
            }else {
                print("Error, have not transformations", error?.localizedDescription ?? "")
            }
        }
        
        
        
        
    }
    
    
    
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        let token = LocalDataLayer.shared.getToken()


        Networklayer.shared.favoriteHeroe(token: token, heroeId: heroe.id) { _, error in

            if self.heroe.favorite == true {
                print(self.heroe.name, "Se ha quitado de favoritos")

            }else{
                print(self.heroe.name, "Se ha marcado como favorito")

            }
            
            DispatchQueue.main.async {
                let transView = TableViewController()
                self.navigationController?.pushViewController(transView, animated: true)
            }
            
        }
        
    }
    
    @IBAction func transformationDetailsAction(_ sender: UIButton) {
        let transView = TransformationsViewController()
        transView.transformations = self.transformations
        
        navigationController?.pushViewController(transView, animated: true)
    }
    
   
}
