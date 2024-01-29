//
//  UserService.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 26.01.2024.
//

import Foundation

class UserService {

  static let shared = UserService()

  private let userDefaults: UserDefaults

  private init() {
    userDefaults = .standard
  }

  func setUserName(_ userName: String) {
    userDefaults.setValue(userName, forKey: "userNick")
  }
}
