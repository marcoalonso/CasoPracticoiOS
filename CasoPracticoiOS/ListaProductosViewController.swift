//
//  ListaProductosViewController.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 25/05/22.
//

import UIKit

class ListaProductosViewController: UIViewController {
    
    // MARK: - Variables
    var productosTabla: [Productos] = []
    var productoManager = ProductoManager()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tablaProductos: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaProductos.delegate = self
        tablaProductos.dataSource = self
        
        productoManager.delegado = self
        
        productoManager.verProductos()
    }
}


// MARK: - Protocolo Metodos
extension ListaProductosViewController: productoManagerDelegado {
    func cargarDatos(productos: [Productos]) {
        productosTabla = productos
        
        DispatchQueue.main.async {
            self.tablaProductos.reloadData()
        }
    }
    
    func huboError(cual: Error) {
        print(cual.localizedDescription)
    }
}


// MARK: - TableView Metodos
extension ListaProductosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productosTabla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaProductos.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = productosTabla[indexPath.row].nombre
        celda.detailTextLabel?.text = "\(productosTabla[indexPath.row].precioRegular)"
        celda.imageView?.loadFrom(URLAddress: "\(productosTabla[indexPath.row].urlImagenes[0])")
//        celda.imageView?.image = UIImage(systemName: "note")
        return celda
    }
    
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

/*
 DispatchQueue.global().async { [weak self] in
     if let data = try? Data(contentsOf: URL(string: self!.productosTabla[indexPath.row].urlImagenes[0])!) {
         if let image = UIImage(data: data) {
             DispatchQueue.main.async {
                 celda.imageView?.image = image
             }
         }
     }
 }
 */
