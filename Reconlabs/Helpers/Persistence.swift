//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/14.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()
    
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    do {
      try viewContext.save()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
    
  let container: NSPersistentContainer
    
  init(inMemory: Bool = false) {
    self.container = NSPersistentContainer(name: "Reconlabs")
    
    if inMemory {
      guard let persistentStoreDescriptions = container.persistentStoreDescriptions.first else { return }
      persistentStoreDescriptions.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    container.viewContext.automaticallyMergesChangesFromParent = true
  }
}
