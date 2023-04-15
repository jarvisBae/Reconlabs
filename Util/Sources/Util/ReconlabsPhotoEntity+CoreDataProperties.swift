//
//  Reconlabs
//
// Created by Jarvis Bae on 2023/04/16.
// Copyright (c) 2023 ADLiveOn All rights reserved.
// Swift Version 5.0
    
//

import CoreData
import Foundation

public extension ReconlabsPhotoEntity {
  @nonobjc class func fetchRequest() -> NSFetchRequest<ReconlabsPhotoEntity> {
    NSFetchRequest<ReconlabsPhotoEntity>(entityName: "ReconlabsPhotoEntity")
  }

  @NSManaged var createDate: Date?
  @NSManaged var imageData: Data?
}

extension ReconlabsPhotoEntity: Identifiable {}
