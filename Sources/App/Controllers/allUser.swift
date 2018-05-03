//
//  allUser.swift
//  App
//
//  Created by VECTOR on 5/2/18.
//

import Foundation
import HTTP
import Vapor

final class allUsers{
    
    // SE MUESTRAN TODOS LOS USUARIOS REGISTRADOS
    var drop:Droplet
    init(_ drop: Droplet) {
        self.drop = drop
    }
    
    func listAllUsers(_ result: Request) throws -> ResponseRepresentable{
     
       let result = try self.drop.database?.driver.raw("SELECT DNI,firstName,lastName,phone,email,password FROM new_user")
        guard let nodoArray = result?.array else{
                return try JSON(node: [])
        }
        return try JSON(node: nodoArray)
    }
}
