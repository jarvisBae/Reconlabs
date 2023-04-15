//
//
//
// Created by Jarvis Bae on 2023/04/15.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0

import CoreData
import SwiftUI

protocol CoreDataHelperProtocol {
  var context: NSManagedObjectContext { get }
  func savePhoto(imageData: Data)
  func loadPhotos() -> [ReconlabsPhotoEntity]
}

public class CoreDataHelper: CoreDataHelperProtocol {
  let context: NSManagedObjectContext
  
  public init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  public func savePhoto(imageData: Data) {
    let newPhoto = ReconlabsPhotoEntity(context: context)
    newPhoto.imageData = imageData
    newPhoto.createDate = Date()
    do {
      try context.save()
      print("Photo saved to Core Data")
    } catch {
      print("Error saving photo to Core Data: \(error)")
    }
  }
   
  public func loadPhotos() -> [ReconlabsPhotoEntity] {
    let fetchRequest: NSFetchRequest<ReconlabsPhotoEntity> = ReconlabsPhotoEntity.fetchRequest()

    do {
      let photos = try context.fetch(fetchRequest)
      print("Loaded \(photos.count) photos from Core Data")
      return photos
    } catch {
      print("Error loading photos from Core Data: \(error)")
      return []
    }
  }
}
