//
//  UserService.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/15/22.
//

import Foundation

public class UserService {
  
  private let endpoint = "https://jsonplaceholder.typicode.com/users"
  
  public func getUsers() -> [User] {
      
    var users = [User]()
    
    func parse(json: Data) {
      let decoder = JSONDecoder()
      if let jsonUsers = try? decoder.decode([User].self, from: json) {
        users = jsonUsers
      }
    }
    
    if let url = URL(string: endpoint) {
      if let data = try? Data(contentsOf: url) {
        parse(json: data)
      }
    }
    
    return users

  }
  
}
