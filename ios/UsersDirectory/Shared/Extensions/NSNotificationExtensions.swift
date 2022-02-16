//
//  NSNotificationExtensions.swift
//  UsersDirectory
//
//  Created by Vincent Bacalso on 2/15/22.
//

import Foundation

public extension NSNotification.Name {
  static let isLoading = NSNotification.Name(rawValue: "isLoading")
  static let isFinishedLoading = NSNotification.Name(rawValue: "isFinishedLoading")
  static let apiError = NSNotification.Name(rawValue: "apiError")
}
