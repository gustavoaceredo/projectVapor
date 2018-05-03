import Vapor

extension Droplet {
  func setupRoutes() throws {
    
    let userController = UserController(drop: self)
    get("user", handler: userController.list)
    post("user", handler: userController.create)
    
    let userRegistrer = UserRegistration(drop: self)
    post("user","registration", handler: userRegistrer.newUser)
    
    let AllUser = allUsers(self)
    get("allUsers", handler: AllUser.listAllUsers)
    get("test", handler: userRegistrer.viewData)
    
  }
}
