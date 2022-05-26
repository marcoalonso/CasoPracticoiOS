//
//  ProductoManager.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 25/05/22.
//

import Foundation

protocol productoManagerDelegado {
    func cargarDatos(productos: [Productos])
    func huboError(cual: Error)
}

struct ProductoManager {
    var delegado: productoManagerDelegado?
    
    func verProductos() {
        let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                //Si hubo error
                if error != nil {
                    print("Error al obtener respuesta de la API \(error!.localizedDescription)")
                    delegado?.huboError(cual: error!)
                }
                
                if let datosSeguros = datos {
                    if let listaProductos = self.parsearJSON(datosProductos: datosSeguros){
                        print("DEBUG: Datos Seguros \(listaProductos)")
                        
                        delegado?.cargarDatos(productos: listaProductos)
                    }
                }
            }
            
            tarea.resume()
        }
    }
    
    func parsearJSON(datosProductos: Data) -> [Productos]? {
        let decodificador = JSONDecoder()
        print("DEBUG: pasearJson")
        do{
            let datosDecodificados = try decodificador.decode(DatosProducto.self, from: datosProductos)
            
            let listaProductos = datosDecodificados.resultado.productos
            
            //print(listaProductos)
            
            return listaProductos
            
        } catch{
            print("Error al decodificar datos: \(error.localizedDescription)")
            return nil
        }
    }
    
}


/*
 
 let nombreProducto = datosDecodificados.resultado.productos[0].nombre
 let precioProducto = datosDecodificados.resultado.productos[0].precioRegular
 let categoriaProducto = datosDecodificados.resultado.productos[0].codigoCategoria
 let imagenURL = datosDecodificados.resultado.productos[0].urlImagenes[0]
 let objModeloProducto = ModeloProducto(nombre: nombreProducto, imagen: imagenURL, precio: precioProducto, codigoCategoria: categoriaProducto)
 
 */
