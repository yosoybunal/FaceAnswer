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
      
// MARK: - REPLACE THIS WIREFRAME WITH OnboardingWireframe
      initialViewController.setRootWireframe(HomeWireframe())
    }

    window.rootViewController = initialViewController
    window.makeKeyAndVisible()
    return true
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentContainer = {
    /*
     The persistent container for the application. This implementation
     creates and returns a container, having loaded the store for the
     application to it. This property is optional since there are legitimate
     error conditions that could cause the creation of the store to fail.
     */
    let container = NSPersistentContainer(name: "FaceAnswer")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

        /*
         Typical reasons for an error here include:
         * The parent directory does not exist, cannot be created, or disallows writing.
         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
         * The device is out of space.
         * The store could not be migrated to the current model version.
         Check the error message to determine what the actual problem was.
         */
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

