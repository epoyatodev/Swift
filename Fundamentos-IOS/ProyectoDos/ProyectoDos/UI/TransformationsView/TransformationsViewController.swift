//
//  TransformationsViewController.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 22/12/22.
//

import UIKit

class TransformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var transformations: [Tranformation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Transformations"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let xibCell = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xibCell, forCellReuseIdentifier: "customTableCell")

        
    }
    
    
    //Delegate and DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let weekDayName = singleRows[indexPath.row]
//
//        cell.textLabel?.text = weekDayName
//
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let transformation = transformations[indexPath.row]
        
        cell.iconImageView.setImage(url: transformation.photo)
        cell.labelCell.text = transformation.name
        cell.descLabel.text = transformation.description
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
        
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    




}
