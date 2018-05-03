import App
import MySQLProvider
import Vapor

class DataUser: NodeRepresentable {
    
    var DNI = Int()
    var firsName = String()
    var lastName = String()
    var phone = Int()
    var email = String()
    var password = String()
    
    
    func makeNode(in context: Context?) throws -> Node {
        return try Node(node: ["DNI":self.DNI,
                               "firsName": self.firsName,
                               "lastName":self.lastName,
                               "phone":self.lastName,
                               "phone":self.phone,
                               "email":self.phone,
                               "password":self.password])
    }
    
}



let config = try Config()
try config.addProvider(MySQLProvider.Provider.self)

let drop = try Droplet(config)

try drop.setup()
try drop.run()


