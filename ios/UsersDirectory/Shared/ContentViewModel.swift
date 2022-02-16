//
//  ContentViewModel.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/15/22.
//

import SwiftUI
import Combine

extension ContentView {
  
  class ViewModel: ObservableObject {
    static let sharedInstance = ViewModel()
    
    @Published var users: [User] = []
    
    var selected: User?
        
    func getUsers() {
      let service = UserService()
      self.users = service.getUsers()
    }
    
  }
}
