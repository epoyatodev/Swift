//
//  CollectionCell.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 14/12/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    //MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
