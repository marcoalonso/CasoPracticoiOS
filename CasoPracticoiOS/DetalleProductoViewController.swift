//
//  ViewController.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 25/05/22.
//

import UIKit

class DetalleProductoViewController: UIViewController {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func verProductosBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "verProductos", sender: self)
    }
    
}





