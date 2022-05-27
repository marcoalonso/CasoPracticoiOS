//
//  ViewController.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 25/05/22.
//

import UIKit

class DetalleProductoViewController: UIViewController {
    
    var productoMostrar:  Productos?
    
    @IBOutlet weak var categoriaProducto: UILabel!
    @IBOutlet weak var precioProducto: UILabel!
    @IBOutlet weak var nombreProducto: UILabel!
    @IBOutlet weak var imagenProducto: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        nombreProducto.text = productoMostrar?.nombre ?? ""
        if let precioProductoMostrar = productoMostrar?.precioRegular {
            precioProducto.text = "Precio : $\(precioProductoMostrar)"
        }
        if let categoriaProductoMostrar = productoMostrar?.codigoCategoria {
            categoriaProducto.text = "Categoria: \(categoriaProductoMostrar)"
        }
        
        
        if let urlImagen = productoMostrar?.urlImagenes.first {
            imagenProducto.loadFrom(URLAddress: urlImagen)
        }
        
        
        
        
        
        
    }
    
    @IBAction func verProductosBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "verProductos", sender: self)
    }
    
}





/*
 extension UIImageView {
     func loadFrom(URLAddress: String) {
         if let image = imagenesCache.object(forKey: URLAddress as NSString) as? UIImage {
             self.image = image
             return
         }
         
         
         guard let url = URL(string: URLAddress) else {
             return
         }
         
         
         
         DispatchQueue.main.async { [weak self] in
             if let imageData = try? Data(contentsOf: url) {
                 if let loadedImage = UIImage(data: imageData) {
                     imagenesCache.setObject(loadedImage, forKey: URLAddress as NSString)
                         self?.image = loadedImage
                 }
             }
         }
     }
 }
 */
