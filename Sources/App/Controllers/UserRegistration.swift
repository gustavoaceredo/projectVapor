//
//  UserRegistration.swift
//  App
//
//  Created by VECTOR on 5/1/18.
//
import HTTP
import Vapor

final class UserRegistration {
    
//REGISTRO UN NUEVO USUARIO
    
    var drop: Droplet
    init(drop:Droplet) {
        self.drop = drop
    }

    func newUser(_ req: Request) throws -> ResponseRepresentable {
        
            guard let DNI = req.json?["DNI"]?.string,
                let firstName = req.json?["firstName"]?.string,
                let lastName = req.json?["lastName"]?.string,
                let phone = req.json?["phone"]?.string,
                let email = req.json?["email"]?.string,
                let password = req.json?["password"]?.string else {
                    
                    throw Abort.badRequest
            }
            
            let result = try self.drop.database?.driver.raw("INSERT INTO new_user(DNI,firstName,lastName,phone,email,password) VALUES(?,?,?,?,?,?)",
                                                       [DNI,firstName,lastName,phone,email,password])
        
        
        if result?.object == nil {
            
            return try JSON(node: ["ESTADO":"OK",
                                   "MENSAJE":"REGISTRO DE USUARIO CORRECTO",
                                   "DATA":["DNI":DNI,
                                           "firstName":firstName,
                                           "lastName":lastName,
                                           "phone":phone,
                                           "email":email,
                                           "password":password]])
        }else{
            return try JSON(node: result)
        }
    }

}
