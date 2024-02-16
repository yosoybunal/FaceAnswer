//
//  AppDelegate.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//

import UIKit
import CoreData

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
      initialViewController.setRootWireframe(AuthenticationWireframe())
    }

    window.rootViewController = initialViewController
    window.makeKeyAndVisible()
    return true
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "FaceAnswer")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
}

// MARK: - User Defaults 

private extension AppDelegate {
  var shouldShowHome: Bool {
    ((UserDefaults.standard.string(forKey: "userNick")?.isEmpty) != nil)
  }
}

