//
//  AppDelegate.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let initialViewController = UINavigationController()
    window = UIWindow(frame: UIScreen.main.bounds)
    guard let window = window else {
      return false
    }

    if shouldShowHome {
      initialViewController.setRootWireframe(HomeWireframe())
    } else {
      
// MARK: - REPLACE THIS WIREFRAME WITH OnboardingWireframe
      initialViewController.setRootWireframe(HomeWireframe())
    }

    window.rootViewController = initialViewController
    window.makeKeyAndVisible()
    return true
  }
}

private extension AppDelegate {
  var shouldShowHome: Bool {
    ((UserDefaults.standard.string(forKey: "userNick")?.isEmpty) != nil)
  }
}

