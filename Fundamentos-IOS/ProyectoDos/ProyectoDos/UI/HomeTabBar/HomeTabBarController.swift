//
//  HomeTabBarController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 13/12/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTabs()
        
            


    }
    
    private func setupTabs(){
        let navigationControler = UINavigationController(rootViewController: TableViewController())
        let tabImageTableView = UIImage(systemName: "text.justify")!    
        navigationControler.tabBarItem = UITabBarItem(title: "TableView", image: tabImageTableView, tag: 0)
        
        let navigationControler2 = UINavigationController(rootViewController: CollectionViewController())
        let tabImageCollectionView = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        navigationControler2.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImageCollectionView, tag: 0)
        
        let navigationController3 = UINavigationController(rootViewController: ProfileViewController())
        let tabImageProfileView = UIImage(systemName: "person.fill")!
        navigationController3.tabBarItem = UITabBarItem(title: "ProfileView", image: tabImageProfileView, tag: 0)
        
        
        
        viewControllers = [navigationControler, navigationControler2, navigationController3]
    }
    

    private func setupLayout(){
        tabBar.backgroundColor = .systemBackground
    }

}
