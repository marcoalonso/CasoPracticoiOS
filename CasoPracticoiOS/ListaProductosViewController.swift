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
    
    var productoSeleccioando: Productos?
    
    // MARK: - IBOutlets
    @IBOutlet weak var tablaProductos: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaProductos.register(UINib(nibName: "CeldaProductoTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaProductos.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaProductoTableViewCell
        celda.tituloProducto.text = productosTabla[indexPath.row].nombre
        celda.imagenProducto.loadFrom(URLAddress: productosTabla[indexPath.row].urlImagenes[0])
        celda.precioProducto.text = "Precio: S\(productosTabla[indexPath.row].precioRegular)"
        celda.categoriaProducto.text = "Categoria: \(productosTabla[indexPath.row].codigoCategoria)"
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablaProductos.deselectRow(at: indexPath, animated: true)
        
        productoSeleccioando = productosTabla[indexPath.row]
        print(productoSeleccioando!)
        performSegue(withIdentifier: "verProductoDetalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verProductoDetalle"{
            let VCDetalleProducto = segue.destination as! DetalleProductoViewController
            VCDetalleProducto.productoMostrar = productoSeleccioando
        }
    }
    
}

//extension UIImageView {
//    func loadFrom(URLAddress: String) {
//        guard let url = URL(string: URLAddress) else {
//            return
//        }
//        
//        DispatchQueue.main.async { [weak self] in
//            if let imageData = try? Data(contentsOf: url) {
//                if let loadedImage = UIImage(data: imageData) {
//                        self?.image = loadedImage
//                }
//            }
//        }
//    }
//}

