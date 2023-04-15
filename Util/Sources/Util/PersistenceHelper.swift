//
//
//
// Created by Jarvis Bae on 2023/04/16.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
import CoreData
import Foundation

public struct PersistenceHelper {
  public static let shared = PersistenceHelper()

  public let container: NSPersistentContainer

  init(inMemory _: Bool = false) {
    self.container = NSPersistentContainer(name: "Reconlabs")
    // 리소스 번들을 찾아 NSPersistentContainer에 전달합니다.
    if let url = Bundle.module.url(forResource: "Reconlabs", withExtension: "momd") {
      container.persistentStoreDescriptions = [NSPersistentStoreDescription(url: url)]
    } else {
      fatalError("Unable to find CoreData model in the package module.")
    }

    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    
//    self.container = NSPersistentContainer(name: "Reconlabs", managedObjectModel: Self.model)
//    if inMemory {
//      container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//    }
//    container.loadPersistentStores(completionHandler: { _, error in
//      if let error = error as NSError? {
//        fatalError("Unresolved error \(error), \(error.userInfo)")
//      }
//    })
  }

  static var model: NSManagedObjectModel = {
    print("package Bundle.module : \(Bundle.module)")
    guard let url = Bundle.module.url(forResource: "Reconlabs", withExtension: "momd"),
          let model = NSManagedObjectModel(contentsOf: url)
    else {
      fatalError("Failed to load model named Reconlabs")
    }
    return model
  }()
}
