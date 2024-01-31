//
//  CoreDataService.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 31.01.2024.
//

import UIKit
import CoreData

final class CoreDataService {

  static let shared = CoreDataService()

  //MARK: - Constants

  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

  func fetchData<T: NSManagedObject>(entity: T.Type,
                                     sortBy:String? = nil,
                                     isAscending:Bool = true,
                                     predicate:NSPredicate? = nil,
                                     completion: @escaping (Result<[T]?,Error>) -> Void) {
    context.perform { [weak self] in
      guard let request: NSFetchRequest<T> = T.fetchRequest() as? NSFetchRequest<T> else  { return }
      request.returnsObjectsAsFaults = false
      request.predicate = predicate

      if (sortBy != nil) {
        let sorter = NSSortDescriptor(key:sortBy, ascending:isAscending)
        request.sortDescriptors = [sorter]
      }

      do {
        let results = try self?.context.fetch(request)
        completion(.success(results))
      }
      catch  {
        print(error.localizedDescription)
        completion(.failure(error))
      }
    }
  }

  func save(completion: ((Bool) -> Void)? = nil) {
    if !context.hasChanges {
      completion?(true)
      return
    }

    context.perform { [weak self] in
      do {
        try self?.context.save()
        print("Successfully saved changes to Core Data")
        completion?(true)
      }
      catch {
        print("Error saving changes to Core Data: \(error.localizedDescription)")
        completion?(false)
      }
    }
  }

  func delete(entity: NSManagedObject, completion: @escaping (Bool) -> Void) {
    context.delete(entity)
    save { isDeleted in
      completion(isDeleted)
    }
  }

  func deleteAll(entityName: String) {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

    do {
      try context.execute(deleteRequest)
      try context.save()
    }
    catch {
      print("Can't delete all")
    }
  }
}
