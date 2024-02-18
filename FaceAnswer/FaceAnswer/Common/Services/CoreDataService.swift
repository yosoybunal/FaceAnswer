//
//  CoreDataService.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 31.01.2024.
//

import UIKit

final class CoreDataService {

  // MARK: - Singleton

  static let shared = CoreDataService()

  //MARK: - Constants

  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
