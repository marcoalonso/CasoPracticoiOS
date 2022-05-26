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
