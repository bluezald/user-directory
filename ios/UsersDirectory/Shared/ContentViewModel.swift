//
//  ContentViewModel.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/15/22.
//

import SwiftUI
import Combine

extension ContentView {
  
  enum SearchMode {
    case byName
    case byId
  }
  
  class ViewModel: ObservableObject {
    static let sharedInstance = ViewModel()
    
    @Published var users: [User] = []
    @Published var filterName: String = ""
    @Published var filterId: String = ""
    @Published var searchMode: SearchMode = .byName
    
    var selected: User?
    
    var showEmptyState: Bool {
      return filteredUsers.count == 0 ? true : false
    }
    
    var filteredUsers: [User] {
      var filtered = [User]()
      if self.filterName != "" {
        filtered = self.users.filter({ user in
          user.name.contains(self.filterName)
        })
      }
      
      if self.filterId != "" {
        filtered = self.users.filter({ user in
          user.id == Int(self.filterId)
        })
      }
      
      if (self.filterName == "" && self.filterId == "") {
        filtered = self.users
      }
      
      return filtered
    }
    
    func getUsers() {
      let service = UserService()
      self.users = service.getUsers()
    }
    
  }
}
