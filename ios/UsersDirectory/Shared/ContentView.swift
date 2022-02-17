//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Bacalso on 2/15/22.
//

import SwiftUI

struct UserRow: View, Identifiable {
  var name: String
  var id: Int
  var phone: String
  var email: String
  
  var body: some View {
    HStack {
      Image("AvatarPlaceholder")
        .resizable()
        .scaledToFit()
        .frame(width: 70.0, height: 70.0)
        .padding(.trailing, 2)
      VStack(alignment: .leading, spacing: 0) {
        HStack {
          Text(name)
            .font(.body)
            .fontWeight(.semibold)
          Text("ID: \(id)")
            .font(.subheadline)
        }
        .padding(.bottom, 4)
        HStack {
          Image(systemName: "envelope.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.trailing, 1)
          Text(phone)
            .font(.subheadline)
        }
        .padding(.bottom, 2)
        Text(email)
          .font(.subheadline)
      }
    }
    .frame(minHeight: 80)
  }
}

struct EmptyState: View {
  
  var body: some View {
    VStack(alignment: .center) {
      Image(systemName: "x.circle.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 70.0, height: 70.0)
        .padding(.trailing, 2)
      Text("No Users Found.")
        .font(.subheadline)
      Text("There's no users based on your search query...")
        .font(.subheadline)
    }
    .frame(minHeight: 80)
  }
}

struct ContentView: View {
  
  @ObservedObject var vm: ViewModel = ViewModel.sharedInstance
  
  var body: some View {
    NavigationView {
      VStack {
        GroupBox {
          DisclosureGroup("Menu") {
            Button {
              vm.searchMode = .byName
            } label: {
              Text("Search By Name")
            }
            .padding(.bottom, 4)
            Button {
              vm.searchMode = .byId
            } label: {
              Text("Search By ID")
            }
          }
        }
        Text("Searching for \(vm.searchMode == .byName ? "Name" : "ID"): \(vm.searchMode == .byName ? vm.filterName : vm.filterId)")
          .searchable(
            text: vm.searchMode == .byName ? $vm.filterName : $vm.filterId
          )
        if (vm.showEmptyState) {
          EmptyState()
          Spacer()
        } else {
          List {
            ForEach(Array(vm.filteredUsers.enumerated()), id: \.offset) { index, user in
              AnyView(NavigationLink(destination: UserDetailsView(user: user)) {
                UserRow(
                  name: user.name,
                  id: user.id,
                  phone: user.phone,
                  email: user.email
                )
              })
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationBarTitle("Users", displayMode: .inline)
    }
    .onAppear(perform: {
      vm.getUsers()
    })
  }
  
}

struct EmptyState_Previews: PreviewProvider {
  static var previews: some View {
    EmptyState()
  }
}

//struct UserRow_Previews: PreviewProvider {
//  static var previews: some View {
//    UserRow(
//      name: "Vincent Bacalso",
//      id: 1,
//      phone: "09476245853",
//      email: "bacalso.vincent@gmail.com"
//    )
//  }
//}
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
