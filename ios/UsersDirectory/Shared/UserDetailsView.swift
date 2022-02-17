//
//  UserDetailsView.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/16/22.
//

import SwiftUI

struct UserIconedDetail: View {
  var icon: String
  var label: String
  var detail: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .font(.callout)
        .fontWeight(.semibold)
        .padding(.bottom, 4)
      HStack {
        Image(systemName: icon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .padding(.trailing, 1)
        Text(detail)
          .font(.subheadline)
      }
    }
    .padding(.bottom)
  }
}

struct UserDetailsView: View {
//  @ObservedObject var vm: ViewModel = ViewModel.sharedInstance
  public var user: User
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        VStack(alignment: .center) {
          Image("AvatarPlaceholder")
            .interpolation(.none)
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .padding(.bottom)
          Text(user.name)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.bottom, 4)
          Text("@\(user.username)")
            .font(.caption)
          Text("ID: \(user.id)")
            .font(.caption)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.bottom, 20)
        VStack(alignment: .leading) {
          UserIconedDetail(
            icon: "envelope.fill",
            label: "Email:",
            detail: user.email)
          UserIconedDetail(
            icon: "phone.fill",
            label: "Phone:",
            detail: user.phone)
          UserIconedDetail(
            icon: "link.circle.fill",
            label: "Website:",
            detail: user.website)
          UserIconedDetail(
            icon: "map.fill",
            label: "Address:",
            detail: getOneLineAddress(address: user.address))
          Text("Company:")
            .font(.callout)
            .fontWeight(.semibold)
            .padding(.bottom, 4)
          Text(user.company.name)
            .font(.body)
            .fontWeight(.bold)
          Text(user.company.catchPhrase)
            .font(.subheadline)
          Text(user.company.bs)
            .font(.subheadline)
        }
      }
      .padding()
      .navigationBarTitle("Details", displayMode: .inline)
    }
  }
  
  private func getOneLineAddress(address: Address) -> String {
    return "\(address.street) \(address.suite), \(address.city) \(address.zipcode)"
  }
  
}

struct UserDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    let company = Company(
      name: "Abernathy Group",
      catchPhrase: "Implemented secondary concept",
      bs: "e-enable extensible e-tailers")
    let address = Address(
      street: "Ellsworth",
      suite: "Summit Suite",
      city: "Aliyaview",
      zipcode: "45169",
      geo: Geo(lat: "", lng: ""))
    let user = User(
      id: 1,
      name: "Nicholas Runolfdottir",
      username: "MAXIME_NIENOW",
      email: "Sherwood@rosamond.me",
      address: address,
      phone: "586.493.6943 x140",
      website: "jacynthe.com",
      company: company
    )
    UserDetailsView(user: user)
  }
}
