//
//  UserModels.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/15/22.
//

import Foundation

public struct Geo: Codable {
  public let lat: String
  public let lng: String
}

public struct Address: Codable {
  public let street: String
  public let suite: String
  public let city: String
  public let zipcode: String
  public let geo: Geo
}

public struct Company: Codable {
  public let name: String
  public let catchPhrase: String
  public let bs: String
}

public struct User: Codable {
  public let id: Int
  public let name: String
  public let username: String
  public let email: String
  public let address: Address
  public let phone: String
  public let website: String
  public let company: Company
}

public struct GetUsersResponse: Codable {
  public let users: [User]
}
