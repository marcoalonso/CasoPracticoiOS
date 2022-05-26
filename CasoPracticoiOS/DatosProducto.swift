//
//  DatosProducto.swift
//  CasoPracticoiOS
//
//  Created by marco rodriguez on 25/05/22.
//

import Foundation

struct DatosProducto: Decodable {
    let codigo: String
    let mensaje: String
    let advertencia: String
    let resultado: Resultado
}

struct Resultado: Decodable {
    let productos: [Productos]
    let categoria: String
}

struct Productos: Decodable {
    let id: String
    let nombre: String
    let precioRegular: Double
    let codigoCategoria: String
    let urlImagenes: [String]
}
