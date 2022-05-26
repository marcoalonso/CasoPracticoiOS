//
//  CeldaProductoTableViewCell.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 26/05/22.
//

import UIKit

class CeldaProductoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoriaProducto: UILabel!
    @IBOutlet weak var tituloProducto: UILabel!
    @IBOutlet weak var precioProducto: UILabel!
    @IBOutlet weak var imagenProducto: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
