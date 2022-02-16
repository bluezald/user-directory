//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Bacalso on 2/15/22.
//

import SwiftUI

struct UserRow: View {
  var imageName: String
  var name: String
  var username: String
  
  var body: some View {
    HStack {
      Image(systemName: imageName)
        .padding(.trailing, 10)
      VStack {
        Text(name)
          .font(.body)
          .fontWeight(.semibold)
          .padding(.bottom, 4)
        Text(username)
          .font(.subheadline)
      }
    }
    .frame(minHeight: 40)
  }
}

struct ContentView: View {
  
  @ObservedObject var vm: ViewModel = ViewModel.sharedInstance
  
  var body: some View {
    VStack {
      List {
        ForEach(Array(vm.users.enumerated()), id: \.offset) { index, user in
          UserRow(imageName: "", name: user.name, username: user.username)
        }
      }
    }
    .onAppear(perform: {
      vm.getUsers()
    })
//    .navigationBarTitle("Users", displayMode: .inline)
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
